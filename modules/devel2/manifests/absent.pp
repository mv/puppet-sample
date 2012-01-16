# Class devel2::absent
#
# Removes devel2 package and its relevant monitor, backup, firewall entries
#
# Usage:
# include devel2::absent
#

class devel2::absent {

    # Load variables defined in params.pp file.
    require devel2::params

    Package { ensure => absent }

    ###
    ### Execution order
    ###
    stage{ "one": }
    stage{ "two": }
    stage{ "three": }

    Stage["three"] -> Stage["two"] -> Stage["one"]
    Stage["one"]   -> Stage["main"]

    class { devel2::absent::prereq1 : stage => "one" }
    class { devel2::absent::prereq2 : stage => "two" }
    class { devel2::absent::prereq3 : stage => "three" }

    ###
    ### Execution
    ###
    class devel2::absent::prereq1 {
        package{ $devel2::params::rpm_prereq1 : }
    }

    class devel2::absent::prereq2 {
        package{ $devel2::params::rpm_prereq2 : }
    }

    class devel2::absent::prereq3 {
        package{ $devel2::params::rpm_prereq3 : }
    }

    package{ $devel2::params::rpm_list    : }

    # Include debug class is debugging is enabled ($debug=yes)
    if ( $debug  == "yes" ) or ( $debug == true ) { include devel2::debug }

}

# vim:ft=puppet:


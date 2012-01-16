# Class devel2::install
#
# It defines package, service, main configuration file.
#
# Usage:
# include devel2
#

class devel2::install {

    # Load variables defined in params.pp file.
    require devel2::params

    Package { ensure => present }

    package{ $devel2::params::rpm_prereq1 : }
    package{ $devel2::params::rpm_prereq2 : }
    package{ $devel2::params::rpm_prereq3 : }
    package{ $devel2::params::rpm_list    : }

    # Include debug class (debug.pp) if debugging is enabled ($debug=yes)
    if ( $debug == "yes" ) or ( $debug == true ) { include devel2::debug }

}

# vim:ft=puppet:


# Class devel3::absent
#
# Removes devel3 package and its relevant monitor, backup, firewall entries
#
# Usage:
# include devel3::absent
#

define devel3::uninstall_force() {
    exec { "rm_force_${name}":
        command	  => "rpm -ev --nodeps --allmatches $name",
        path      => "/bin:/usr/bin",
        onlyif    => "rpm -ql $name",
        logoutput => on_failure,
    }
}

class devel3::absent {

    # Load variables defined in params.pp file.
    require devel3::params

    Package { ensure => absent }

    ###
    ### Execution order
    ###
    stage{ "one": }
    stage{ "two": }

    Stage["one"] -> Stage["two"] -> Stage["main"]

    class { devel3::absent::prereq   : stage => "one" }
    class { devel3::absent::rpm_list : stage => "two" }

    ###
    ### Execution
    ###
    class devel3::absent::prereq {
        devel3::uninstall_force { $devel3::params::rpm_list : }
    }

    class devel3::absent::rpm_list {
        package{ $devel3::params::rpm_list : }
    }

}

# vim:ft=puppet:


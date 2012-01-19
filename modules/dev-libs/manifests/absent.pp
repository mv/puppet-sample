# Class dev-libs::absent
#
# Removes dev-libs package and its relevant monitor, backup, firewall entries
#
# Usage:
# include dev-libs::absent
#

define dev-libs::uninstall_force() {
    exec { "rm_force_${name}":
        command	  => "rpm -ev --nodeps --allmatches $name",
        path      => "/bin:/usr/bin",
        onlyif    => "rpm -ql $name",
        logoutput => on_failure,
    }
}

class dev-libs::absent {

    # Load variables defined in params.pp file.
    require dev-libs::params

    Package { ensure => absent }

    ###
    ### Execution order
    ###
    stage{ "one": }
    stage{ "two": }

    Stage["one"] -> Stage["two"] -> Stage["main"]

    class { dev-libs::absent::prereq   : stage => "one" }
    class { dev-libs::absent::rpm_list : stage => "two" }

    ###
    ### Execution
    ###
    class dev-libs::absent::prereq {
        dev-libs::uninstall_force { $dev-libs::params::rpm_list : }
    }

    class dev-libs::absent::rpm_list {
        package{ $dev-libs::params::rpm_list : }
    }

}

# vim:ft=puppet:


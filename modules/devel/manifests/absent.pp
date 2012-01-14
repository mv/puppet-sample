# Class devel::absent
#
# Removes devel package and its relevant monitor, backup, firewall entries
#
# Usage:
# include devel::absent
#

define devel::uninstall_force() {
    exec { "rm_force_${name}":
        command	  => "rpm -ev --nodeps --allmatches $name",
        path      => "/bin:/usr/bin",
        onlyif    => "rpm -ql $name",
        logoutput => on_failure,
    }
}

class devel::absent {

    # Load variables defined in params.pp file.
    require devel::params

    case $operatingsystem {
        /CentOS|RedHat|Amazon/: {
            devel::uninstall_force { $devel::params::pkg_name : }
        } # centos

        default: {
            package { $devel::params::pkg_name : ensure => absent }
        } # default

    } # case


    # Include debug class is debugging is enabled ($debug=yes)
    if ( $debug  == "yes" ) or ( $debug == true ) { include devel::debug }

}

# vim:ft=puppet:


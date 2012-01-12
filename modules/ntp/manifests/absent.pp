# Class: ntp::absent
#
# Removes ntp package and its relevant monitor, backup, firewall entries
#
# Usage:
# include ntp::absent
#

class ntp::absent {

    # Load variables defined in params.pp file.
    require ntp::params

    package { "ntp":
        name   => "${ntp::params::pkg_name}",
        ensure => absent,
    }

    # Remove relevant monitor, backup, firewall entries
    if $backup   == "yes" { include ntp::backup::absent   }
    if $monitor  == "yes" { include ntp::monitor::absent  }
    if $firewall == "yes" { include ntp::firewall::absent }

    # Include debug class is debugging is enabled ($debug=yes)
    if ( $debug  == "yes" ) or ( $debug == true ) { include ntp::debug }

}

# vim:ft=puppet:


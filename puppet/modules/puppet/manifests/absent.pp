# Class puppet::absent
#
# Removes puppet package and its relevant monitor, backup, firewall entries
#
# Usage:
# include puppet::absent
#

class puppet::absent {

    # Load variables defined in params.pp file.
    require puppet::params

    package { "puppet":
        name   => "${puppet::params::pkg_name}",
        ensure => absent,
    }

    # Remove relevant monitor, backup, firewall entries
    if $backup   == "yes" { include puppet::backup::absent   }
    if $monitor  == "yes" { include puppet::monitor::absent  }
    if $firewall == "yes" { include puppet::firewall::absent }

    # Include debug class is debugging is enabled ($debug=yes)
    if ( $debug  == "yes" ) or ( $debug == true ) { include puppet::debug }

}

# vim:ft=puppet:


# Class sudo::absent
#
# Removes sudo package and its relevant monitor, backup, firewall entries
#
# Usage:
# include sudo::absent
#

class sudo::absent {

    # Load variables defined in params.pp file.
    require sudo::params

    package { "sudo":
        name   => "${sudo::params::pkg_name}",
        ensure => absent,
    }

    # Remove relevant monitor, backup, firewall entries
    if $backup   == "yes" { include sudo::backup::absent   }
    if $monitor  == "yes" { include sudo::monitor::absent  }
    if $firewall == "yes" { include sudo::firewall::absent }

    # Include debug class is debugging is enabled ($debug=yes)
    if ( $debug  == "yes" ) or ( $debug == true ) { include sudo::debug }

}

# vim:ft=puppet:


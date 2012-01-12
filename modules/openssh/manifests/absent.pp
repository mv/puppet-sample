# Class openssh::absent
#
# Removes openssh package and its relevant monitor, backup, firewall entries
#
# Usage:
# include openssh::absent
#

class openssh::absent {

    # Load variables defined in params.pp file.
    require openssh::params

    package { "openssh":
        name   => "${openssh::params::pkg_name}",
        ensure => absent,
    }

    # Remove relevant monitor, backup, firewall entries
    if $backup   == "yes" { include openssh::backup::absent   }
    if $monitor  == "yes" { include openssh::monitor::absent  }
    if $firewall == "yes" { include openssh::firewall::absent }

    # Include debug class is debugging is enabled ($debug=yes)
    if ( $debug  == "yes" ) or ( $debug == true ) { include openssh::debug }

}

# vim:ft=puppet:


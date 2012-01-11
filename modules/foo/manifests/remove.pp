# Class: foo::absent
#
# Removes foo package and its relevant monitor, backup, firewall entries
#
# Usage:
# include foo::absent
#

class foo::absent {

    require foo::params

    package { "foo":
        name   => "${foo::params::pkg_name}",
        ensure => absent,
    }

    # Remove relevant monitor, backup, firewall entries
    if $backup   == "yes" { include foo::backup::absent   }
    if $monitor  == "yes" { include foo::monitor::absent  }
    if $firewall == "yes" { include foo::firewall::absent }

    # Include debug class is debugging is enabled ($debug=yes)
    if ( $debug  == "yes" ) or ( $debug == true ) { include foo::debug }

}

# vim:ft=puppet:


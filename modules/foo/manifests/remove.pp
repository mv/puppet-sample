# Class: foo::remove
#
# Removes foo package and its relevant monitor, backup, firewall entries
#
# Usage:
# include foo::remove
#

class foo::remove {

    require foo::params

    package { "foo":
        name   => "${foo::params::pkg_name}",
        ensure => absent,
    }

    # Remove relevant monitor, backup, firewall entries
    if $backup   == "yes" { include foo::backup::remove   }
    if $monitor  == "yes" { include foo::monitor::remove  }
    if $firewall == "yes" { include foo::firewall::remove }

    # Include debug class is debugging is enabled ($debug=yes)
    if ( $debug  == "yes" ) or ( $debug == true ) { include foo::debug }

}

# vim:ft=pp:


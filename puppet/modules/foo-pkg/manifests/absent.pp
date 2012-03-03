# Class foo-pkg::absent
#
# Removes foo-pkg package and its relevant monitor, backup, firewall entries
#
# Usage:
# include foo-pkg::absent
#

class foo-pkg::absent {

    # Load variables defined in params.pp file.
    require foo-pkg::params

    package { "foo-pkg":
        name   => "${foo-pkg::params::pkg_name}",
        ensure => absent,
    }

    # Remove relevant monitor, backup, firewall entries
    if $backup   == "yes" { include foo-pkg::backup::absent   }
    if $monitor  == "yes" { include foo-pkg::monitor::absent  }
    if $firewall == "yes" { include foo-pkg::firewall::absent }

    # Include debug class is debugging is enabled ($debug=yes)
    if ( $debug  == "yes" ) or ( $debug == true ) { include foo-pkg::debug }

}

# vim:ft=puppet:


# Class foo-pkg-service::absent
#
# Removes foo-pkg-service package and its relevant monitor, backup, firewall entries
#
# Usage:
# include foo-pkg-service::absent
#

class foo-pkg-service::absent {

    # Load variables defined in params.pp file.
    require foo-pkg-service::params

    package { "foo-pkg-service":
        name   => "${foo-pkg-service::params::pkg_name}",
        ensure => absent,
    }

    # Remove relevant monitor, backup, firewall entries
    if $backup   == "yes" { include foo-pkg-service::backup::absent   }
    if $monitor  == "yes" { include foo-pkg-service::monitor::absent  }
    if $firewall == "yes" { include foo-pkg-service::firewall::absent }

    # Include debug class is debugging is enabled ($debug=yes)
    if ( $debug  == "yes" ) or ( $debug == true ) { include foo-pkg-service::debug }

}

# vim:ft=puppet:


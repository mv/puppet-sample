# Class foo-pkg-service::disable
#
# Stops foo-pkg-service service and disables it at boot time
# Removes the monitor checks, but not the other extended elements (backup, firewall)
# Use foo-pkg-service::absent to remove everything
#
# Usage:
# include foo-pkg-service::disable
#
class foo-pkg-service::disable {

    require foo-pkg-service::params

    package { "foo-pkg-service":
        name   => "${foo-pkg-service::params::pkg_name}",
        ensure => present,
    }

    service { "foo-pkg-service":
        name       => "${foo-pkg-service::params::service_name}",
        ensure     => "stopped" ,
        enable     => "false",
        has_status => "${foo-pkg-service::params::has_status}",
        pattern    => "${foo-pkg-service::params::process_name}",
        require    => Package["foo-pkg-service"],
    }

    # Remove relevant monitor, backup, firewall entries
  # if $backup   == "yes" { include foo-pkg-service::backup::absent   }
    if $monitor  == "yes" { include foo-pkg-service::monitor::absent  }
  # if $firewall == "yes" { include foo-pkg-service::firewall::absent }

    # Include debug class is debugging is enabled ($debug=yes)
    if ( $debug  == "yes" ) or ( $debug == true ) { include foo-pkg-service::debug }

}

# vim:ft=puppet:


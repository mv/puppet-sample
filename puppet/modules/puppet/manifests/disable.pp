# Class puppet::disable
#
# Stops puppet service and disables it at boot time
# Removes the monitor checks, but not the other extended elements (backup, firewall)
# Use puppet::absent to remove everything
#
# Usage:
# include puppet::disable
#
class puppet::disable {

    require puppet::params

    package { "puppet":
        name   => "${puppet::params::pkg_name}",
        ensure => present,
    }

    service { "puppet":
        name       => "${puppet::params::service_name}",
        ensure     => "stopped" ,
        enable     => "false",
        has_status => "${puppet::params::has_status}",
        pattern    => "${puppet::params::process_name}",
        require    => Package["puppet"],
    }

    # Remove relevant monitor, backup, firewall entries
  # if $backup   == "yes" { include puppet::backup::absent   }
    if $monitor  == "yes" { include puppet::monitor::absent  }
  # if $firewall == "yes" { include puppet::firewall::absent }

    # Include debug class is debugging is enabled ($debug=yes)
    if ( $debug  == "yes" ) or ( $debug == true ) { include puppet::debug }

}

# vim:ft=puppet:


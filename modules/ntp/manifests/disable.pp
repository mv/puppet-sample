# Class: ntp::disable
#
# Stops ntp service and disables it at boot time
# Removes the monitor checks, but not the other extended elements (backup, firewall)
# Use ntp::absent to remove everything
#
# Usage:
# include ntp::disable
#
class ntp::disable {

    require ntp::params

    package { "ntp":
        name   => "${ntp::params::pkg_name}",
        ensure => present,
    }

    service { "ntp":
        name       => "${ntp::params::service_name}",
        ensure     => "stopped" ,
        enable     => "false",
        has_status => "${ntp::params::has_status}",
        pattern    => "${ntp::params::process_name}",
        require    => Package["ntp"],
    }

    # Remove relevant monitor, backup, firewall entries
  # if $backup   == "yes" { include ntp::backup::absent   }
    if $monitor  == "yes" { include ntp::monitor::absent  }
  # if $firewall == "yes" { include ntp::firewall::absent }

    # Include debug class is debugging is enabled ($debug=yes)
    if ( $debug  == "yes" ) or ( $debug == true ) { include ntp::debug }

}

# vim:ft=puppet:


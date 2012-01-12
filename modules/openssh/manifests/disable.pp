# Class openssh::disable
#
# Stops openssh service and disables it at boot time
# Removes the monitor checks, but not the other extended elements (backup, firewall)
# Use openssh::absent to remove everything
#
# Usage:
# include openssh::disable
#
class openssh::disable {

    require openssh::params

    package { "openssh":
        name   => "${openssh::params::pkg_name}",
        ensure => present,
    }

    service { "openssh":
        name       => "${openssh::params::service_name}",
        ensure     => "stopped" ,
        enable     => "false",
        has_status => "${openssh::params::has_status}",
        pattern    => "${openssh::params::process_name}",
        require    => Package["openssh"],
    }

    # Remove relevant monitor, backup, firewall entries
  # if $backup   == "yes" { include openssh::backup::absent   }
    if $monitor  == "yes" { include openssh::monitor::absent  }
  # if $firewall == "yes" { include openssh::firewall::absent }

    # Include debug class is debugging is enabled ($debug=yes)
    if ( $debug  == "yes" ) or ( $debug == true ) { include openssh::debug }

}

# vim:ft=puppet:


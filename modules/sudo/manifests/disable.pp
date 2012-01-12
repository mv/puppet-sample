# Class sudo::disable
#
# Stops sudo service and disables it at boot time
# Removes the monitor checks, but not the other extended elements (backup, firewall)
# Use sudo::absent to remove everything
#
# Usage:
# include sudo::disable
#
class sudo::disable {

    require sudo::params

    package { "sudo":
        name   => "${sudo::params::pkg_name}",
        ensure => present,
    }

    service { "sudo":
        name       => "${sudo::params::service_name}",
        ensure     => "stopped" ,
        enable     => "false",
        has_status => "${sudo::params::has_status}",
        pattern    => "${sudo::params::process_name}",
        require    => Package["sudo"],
    }

    # Remove relevant monitor, backup, firewall entries
  # if $backup   == "yes" { include sudo::backup::absent   }
    if $monitor  == "yes" { include sudo::monitor::absent  }
  # if $firewall == "yes" { include sudo::firewall::absent }

    # Include debug class is debugging is enabled ($debug=yes)
    if ( $debug  == "yes" ) or ( $debug == true ) { include sudo::debug }

}

# vim:ft=puppet:


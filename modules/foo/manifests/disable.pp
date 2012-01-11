# Class: foo::disable
#
# Stops foo service and disables it at boot time
# Removes the monitor checks, but not the other extended elements (backup, firewall)
# Use foo::absent to remove everything
#
# Usage:
# include foo::disable
#
class foo::disable {

    require foo::params

    package { "foo":
        name   => "${foo::params::pkg_name}",
        ensure => present,
    }

    service { "foo":
        name       => "${foo::params::service_name}",
        ensure     => "stopped" ,
        enable     => "false",
        has_status => "${foo::params::has_status}",
        pattern    => "${foo::params::process_name}",
        require    => Package["foo"],
    }

    # Remove relevant monitor, backup, firewall entries
  # if $backup   == "yes" { include foo::backup::absent   }
    if $monitor  == "yes" { include foo::monitor::absent  }
  # if $firewall == "yes" { include foo::firewall::absent }

    # Include debug class is debugging is enabled ($debug=yes)
    if ( $debug  == "yes" ) or ( $debug == true ) { include foo::debug }

}

# vim:ft=puppet:


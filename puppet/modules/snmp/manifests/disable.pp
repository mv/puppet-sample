# Class snmp::disable
#
# Stops snmp service and disables it at boot time
# Removes the monitor checks, but not the other extended elements (backup, firewall)
# Use snmp::absent to remove everything
#
# Usage:
# include snmp::disable
#
class snmp::disable {

    require snmp::params

    package { "snmp":
        name   => "${snmp::params::pkg_name}",
        ensure => present,
    }

    service { "snmp":
        name       => "${snmp::params::service_name}",
        ensure     => "stopped" ,
        enable     => "false",
        has_status => "${snmp::params::has_status}",
        pattern    => "${snmp::params::process_name}",
        require    => Package["snmp"],
    }

    # Remove relevant monitor, backup, firewall entries
  # if $backup   == "yes" { include snmp::backup::absent   }
    if $monitor  == "yes" { include snmp::monitor::absent  }
  # if $firewall == "yes" { include snmp::firewall::absent }

    # Include debug class is debugging is enabled ($debug=yes)
    if ( $debug  == "yes" ) or ( $debug == true ) { include snmp::debug }

}

# vim:ft=puppet:


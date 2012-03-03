# Class snmp::absent
#
# Removes snmp package and its relevant monitor, backup, firewall entries
#
# Usage:
# include snmp::absent
#

class snmp::absent {

    # Load variables defined in params.pp file.
    require snmp::params

    package { "snmp":
        name   => "${snmp::params::pkg_name}",
        ensure => absent,
    }

    # Remove relevant monitor, backup, firewall entries
    if $backup   == "yes" { include snmp::backup::absent   }
    if $monitor  == "yes" { include snmp::monitor::absent  }
    if $firewall == "yes" { include snmp::firewall::absent }

    # Include debug class is debugging is enabled ($debug=yes)
    if ( $debug  == "yes" ) or ( $debug == true ) { include snmp::debug }

}

# vim:ft=puppet:


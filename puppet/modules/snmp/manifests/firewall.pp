# Class snmp::firewall
#
# Manages snmp firewalling using custom Firewall wrapper
# By default it opens snmp's default port(s) to anybody
# It's automatically included if $firewall=yes
#
# Usage:
# Automatically included if $firewall=yes
#
class snmp::firewall {

    include snmp::params
    include snmp::firewall::params

    firewall { "snmp_${snmp::params::protocol}_${snmp::params::port}":
        source      => "${snmp::params::firewall_source_real}",
        destination => "${snmp::params::firewall_destination_real}",
        protocol    => "${snmp::params::protocol}",
        port        => "${snmp::params::port}",
        action      => "allow",
        direction   => "input",
        enable      => "${snmp::params::firewall_enable}",
    }

}

# vim:ft=puppet:


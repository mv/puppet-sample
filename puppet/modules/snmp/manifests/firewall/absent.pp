# Class snmp::firewall::absent
#
# Remove snmp firewall elements
#

class snmp::firewall::absent {

    include snmp::params

    firewall { "snmp_${snmp::params::protocol}_${snmp::params::port}":
        source      => "${snmp::params::firewall_source_real}",
        destination => "${snmp::params::firewall_destination_real}",
        protocol    => "${snmp::params::protocol}",
        port        => "${snmp::params::port}",
        action      => "allow",
        direction   => "input",
        enable      => "false",
    }

}

# vim:ft=puppet:


# Class snmp::firewall::params
#
# Sets internal variables and defaults for snmp module
# This class is loaded in all the classes that use the values set here
#
class snmp::firewall::params  {


### DEFAULTS FOR FIREWALL CLASS

# These are settings that influence the (optional) snmp::firewall class
# You can define these variables or leave the defaults

    # Source IPs that can access this service - Use iptables friendly format
    $firewall_source_real = $snmp_firewall_source ? {
           ''      => $firewall_source ? {
           ''      => "0.0.0.0/0",
           default => $firewall_source,
        },
        default => "$snmp_firewall_source",
    }

    # Destination IP to use for this host (Default facter's $ipaddress)
    $firewall_destination_real = $snmp_firewall_destination ? {
           ''      => $firewall_destination ? {
           ''      => "${ipaddress}",
           default => $firewall_destination,
        },
        default => "$snmp_firewall_destination",
    }

    # If firewall filter is enabled
    $firewall_enable = $snmp_firewall_enable ? {
           ''      => $firewall_enable ? {
           ''      => true,
           default => $firewall_enable,
        },
        default => $snmp_firewall_enable,
    }

}

# vim:ft=puppet:


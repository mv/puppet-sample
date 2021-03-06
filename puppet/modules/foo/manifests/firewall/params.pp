# Class foo::firewall::params
#
# Sets internal variables and defaults for foo module
# This class is loaded in all the classes that use the values set here
#
class foo::firewall::params  {


### DEFAULTS FOR FIREWALL CLASS

# These are settings that influence the (optional) foo::firewall class
# You can define these variables or leave the defaults

    # Source IPs that can access this service - Use iptables friendly format
    $firewall_source_real = $foo_firewall_source ? {
           ''      => $firewall_source ? {
           ''      => "0.0.0.0/0",
           default => $firewall_source,
        },
        default => "$foo_firewall_source",
    }

    # Destination IP to use for this host (Default facter's $ipaddress)
    $firewall_destination_real = $foo_firewall_destination ? {
           ''      => $firewall_destination ? {
           ''      => "${ipaddress}",
           default => $firewall_destination,
        },
        default => "$foo_firewall_destination",
    }

    # If firewall filter is enabled
    $firewall_enable = $foo_firewall_enable ? {
           ''      => $firewall_enable ? {
           ''      => true,
           default => $firewall_enable,
        },
        default => $foo_firewall_enable,
    }

}

# vim:ft=puppet:


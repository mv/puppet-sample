# Class foo-pkg-service::firewall::params
#
# Sets internal variables and defaults for foo-pkg-service module
# This class is loaded in all the classes that use the values set here
#
class foo-pkg-service::firewall::params  {


### DEFAULTS FOR FIREWALL CLASS

# These are settings that influence the (optional) foo-pkg-service::firewall class
# You can define these variables or leave the defaults

    # Source IPs that can access this service - Use iptables friendly format
    $firewall_source_real = $foo-pkg-service_firewall_source ? {
           ''      => $firewall_source ? {
           ''      => "0.0.0.0/0",
           default => $firewall_source,
        },
        default => "$foo-pkg-service_firewall_source",
    }

    # Destination IP to use for this host (Default facter's $ipaddress)
    $firewall_destination_real = $foo-pkg-service_firewall_destination ? {
           ''      => $firewall_destination ? {
           ''      => "${ipaddress}",
           default => $firewall_destination,
        },
        default => "$foo-pkg-service_firewall_destination",
    }

    # If firewall filter is enabled
    $firewall_enable = $foo-pkg-service_firewall_enable ? {
           ''      => $firewall_enable ? {
           ''      => true,
           default => $firewall_enable,
        },
        default => $foo-pkg-service_firewall_enable,
    }

}

# vim:ft=puppet:


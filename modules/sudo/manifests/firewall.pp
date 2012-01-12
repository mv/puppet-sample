# Class sudo::firewall
#
# Manages sudo firewalling using custom Firewall wrapper
# By default it opens sudo's default port(s) to anybody
# It's automatically included if $firewall=yes
#
# Usage:
# Automatically included if $firewall=yes
#
class sudo::firewall {

    include sudo::params

    firewall { "sudo_${sudo::params::protocol}_${sudo::params::port}":
        source      => "${sudo::params::firewall_source_real}",
        destination => "${sudo::params::firewall_destination_real}",
        protocol    => "${sudo::params::protocol}",
        port        => "${sudo::params::port}",
        action      => "allow",
        direction   => "input",
        enable      => "${sudo::params::firewall_enable}",
    }

}

# vim:ft=puppet:


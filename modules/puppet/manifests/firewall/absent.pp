# Class puppet::firewall::absent
#
# Remove puppet firewall elements
#

class puppet::firewall::absent {

    include puppet::params

    firewall { "puppet_${puppet::params::protocol}_${puppet::params::port}":
        source      => "${puppet::params::firewall_source_real}",
        destination => "${puppet::params::firewall_destination_real}",
        protocol    => "${puppet::params::protocol}",
        port        => "${puppet::params::port}",
        action      => "allow",
        direction   => "input",
        enable      => "false",
    }

}

# vim:ft=puppet:


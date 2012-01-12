# Class sudo::firewall::absent
#
# Remove sudo firewall elements
#

class sudo::firewall::absent {

    include sudo::params

    firewall { "sudo_${sudo::params::protocol}_${sudo::params::port}":
        source      => "${sudo::params::firewall_source_real}",
        destination => "${sudo::params::firewall_destination_real}",
        protocol    => "${sudo::params::protocol}",
        port        => "${sudo::params::port}",
        action      => "allow",
        direction   => "input",
        enable      => "false",
    }

}

# vim:ft=puppet:


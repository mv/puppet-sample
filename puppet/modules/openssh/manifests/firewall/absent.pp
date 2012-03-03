# Class openssh::firewall::absent
#
# Remove openssh firewall elements
#

class openssh::firewall::absent {

    include openssh::params

    firewall { "openssh_${openssh::params::protocol}_${openssh::params::port}":
        source      => "${openssh::params::firewall_source_real}",
        destination => "${openssh::params::firewall_destination_real}",
        protocol    => "${openssh::params::protocol}",
        port        => "${openssh::params::port}",
        action      => "allow",
        direction   => "input",
        enable      => "false",
    }

}

# vim:ft=puppet:


# Class foo-pkg-service::firewall::absent
#
# Remove foo-pkg-service firewall elements
#

class foo-pkg-service::firewall::absent {

    include foo-pkg-service::params

    firewall { "foo-pkg-service_${foo-pkg-service::params::protocol}_${foo-pkg-service::params::port}":
        source      => "${foo-pkg-service::params::firewall_source_real}",
        destination => "${foo-pkg-service::params::firewall_destination_real}",
        protocol    => "${foo-pkg-service::params::protocol}",
        port        => "${foo-pkg-service::params::port}",
        action      => "allow",
        direction   => "input",
        enable      => "false",
    }

}

# vim:ft=puppet:


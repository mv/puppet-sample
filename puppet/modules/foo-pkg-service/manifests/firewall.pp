# Class foo-pkg-service::firewall
#
# Manages foo-pkg-service firewalling using custom Firewall wrapper
# By default it opens foo-pkg-service's default port(s) to anybody
# It's automatically included if $firewall=yes
#
# Usage:
# Automatically included if $firewall=yes
#
class foo-pkg-service::firewall {

    include foo-pkg-service::params
    include foo-pkg-service::firewall::params

    firewall { "foo-pkg-service_${foo-pkg-service::params::protocol}_${foo-pkg-service::params::port}":
        source      => "${foo-pkg-service::params::firewall_source_real}",
        destination => "${foo-pkg-service::params::firewall_destination_real}",
        protocol    => "${foo-pkg-service::params::protocol}",
        port        => "${foo-pkg-service::params::port}",
        action      => "allow",
        direction   => "input",
        enable      => "${foo-pkg-service::params::firewall_enable}",
    }

}

# vim:ft=puppet:


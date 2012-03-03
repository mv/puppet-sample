# Class foo-pkg-service::params
#
# Sets internal variables and defaults for foo-pkg-service module
# This class is loaded in all the classes that use the values set here
#
class foo-pkg-service::params  {

## DEFAULTS FOR VARIABLES USERS CAN SET
# (Here are set the defaults, provide your custom variables externally)
# (The default used is in the line with '')

## Example: Full hostname of foo-pkg-service server
#    $server = $foo-pkg-service_server ? {
#        ''      => "foo-pkg-service",
#        default => "${foo-pkg-service_server}",
#    }


###
### EXTRA MODULE INTERNAL VARIABLES
###
# (add here module specific internal variables)



###
### MODULE INTERNAL VARIABLES
###
# (Modify to adapt to unsupported OSes)

    $pkg_name = $operatingsystem ? {
        redhat     => "foo-pkg-service",
        centos     => "foo-pkg-service",
        default    => "foo-pkg-service",
    }

    $service_name = $operatingsystem ? {
        redhat     => "foo-pkg-serviced",
        centos     => "foo-pkg-serviced",
        default    => "foo-pkg-serviced",
    }

    $process_name = $operatingsystem ? {
        default => "foo-pkg-serviced",
    }

    $has_status = $operatingsystem ? {
        debian  => false,
        ubuntu  => false,
        default => true,
    }

    $config_file = $operatingsystem ? {
        freebsd => "/usr/local/etc/foo-pkg-service/foo-pkg-service.conf",
        redhat  => "/etc/foo-pkg-service.conf",
        centos  => "/etc/foo-pkg-service.conf",
        default => "/etc/foo-pkg-service/foo-pkg-service.conf",
    }

    $config_file_mode = $operatingsystem ? {
        default => "644",
    }

    $config_file_owner = $operatingsystem ? {
        default => "root",
    }

    $config_file_group = $operatingsystem ? {
        default => "root",
    }

    $config_dir = $operatingsystem ? {
        redhat  => "/etc/foo-pkg-service.conf",
        centos  => "/etc/foo-pkg-service.conf",
        default => "/etc/foo-pkg-service",
    }

    $init_config_file = $operatingsystem ? {
        debian  => "/etc/default/foo-pkg-service",
        ubuntu  => "/etc/default/foo-pkg-service",
        redhat  => "/etc/sysconfig/foo-pkg-serviced",
        centos  => "/etc/sysconfig/foo-pkg-serviced",
        default => "/etc/sysconfig/foo-pkg-service",
    }

    # TODO: Used by monitor class
    $pid_file = $operatingsystem ? {
        default => "/var/run/foo-pkg-serviced.pid",
    }

    # TODO: Used by backup class
    $data_dir = $operatingsystem ? {
        default => "/var/lib/foo-pkg-service",
    }

    # TODO: Used by backup and logrotate class
    $log_dir = $operatingsystem ? {
        default => "/var/log/foo-pkg-service",
    }

    # Used by monitor and firewall class
    # If you need to define additional ports, call them
    # $protocol1/$port1 and add the relevant
    # parts in firewall.pp and monitor.pp
    $protocol = "udp"
    $port     = "3350"

}

# vim:ft=puppet:


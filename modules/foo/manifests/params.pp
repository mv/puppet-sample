# Class foo::params
#
# Sets internal variables and defaults for foo module
# This class is loaded in all the classes that use the values set here
#
class foo::params  {

## DEFAULTS FOR VARIABLES USERS CAN SET
# (Here are set the defaults, provide your custom variables externally)
# (The default used is in the line with '')

## Example: Full hostname of foo server
#    $server = $foo_server ? {
#        ''      => "foo",
#        default => "${foo_server}",
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
        redhat     => "foo",
        centos     => "foo",
        default    => "foo",
    }

    $service_name = $operatingsystem ? {
        redhat     => "foo",
        centos     => "foo",
        default    => "foo",
    }

    $process_name = $operatingsystem ? {
        default => "foo",
    }

    $has_status = $operatingsystem ? {
        debian  => false,
        ubuntu  => false,
        default => true,
    }

    $config_dir = $operatingsystem ? {
        redhat  => "/etc/foo.conf",
        centos  => "/etc/foo.conf",
        default => "/etc/foo",
    }

    $config_file = $operatingsystem ? {
        freebsd => "/usr/local/etc/foo/foo.conf",
        redhat  => "/etc/foo.conf",
        centos  => "/etc/foo.conf",
        default => "/etc/foo/foo.conf",
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

    $init_config_file = $operatingsystem ? {
        debian  => "/etc/default/foo",
        ubuntu  => "/etc/default/foo",
        redhat  => "/etc/sysconfig/foo",
        centos  => "/etc/sysconfig/foo",
        default => "/etc/sysconfig/foo",
    }

    # TODO: Used by monitor class
    $pid_file = $operatingsystem ? {
        default => "/var/run/foo.pid",
    }

    # TODO: Used by backup class
    $data_dir = $operatingsystem ? {
        default => "/var/lib/foo",
    }

    # TODO: Used by backup and logrotate class
    $log_dir = $operatingsystem ? {
        default => "/var/log/foo",
    }

    # Used by monitor and firewall class
    # If you need to define additional ports, call them
    # $protocol1/$port1 and add the relevant
    # parts in firewall.pp and monitor.pp
    $protocol = "tcp"
    $port     = "8080"

}

# vim:ft=puppet:


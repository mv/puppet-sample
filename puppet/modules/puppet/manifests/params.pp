# Class puppet::params
#
# Sets internal variables and defaults for puppet module
# This class is loaded in all the classes that use the values set here
#
class puppet::params  {

## DEFAULTS FOR VARIABLES USERS CAN SET
# (Here are set the defaults, provide your custom variables externally)
# (The default used is in the line with '')

## Example: Full hostname of puppet server
#    $server = $puppet_server ? {
#        ''      => "puppet",
#        default => "${puppet_server}",
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
        redhat     => "puppet",
        centos     => "puppet",
        default    => "puppet",
    }

    $service_name = $operatingsystem ? {
        redhat     => "puppet",
        centos     => "puppet",
        default    => "puppet",
    }

    $process_name = $operatingsystem ? {
        default => "puppet",
    }

    $has_status = $operatingsystem ? {
        debian  => false,
        ubuntu  => false,
        default => true,
    }

    $config_dir = $operatingsystem ? {
        redhat  => "/etc/puppet.conf",
        centos  => "/etc/puppet.conf",
        default => "/etc/puppet",
    }

    $config_file = $operatingsystem ? {
        freebsd => "/usr/local/etc/puppet/puppet.conf",
        redhat  => "/etc/puppet.conf",
        centos  => "/etc/puppet.conf",
        default => "/etc/puppet/puppet.conf",
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
        debian  => "/etc/default/puppet",
        ubuntu  => "/etc/default/puppet",
        redhat  => "/etc/sysconfig/puppet",
        centos  => "/etc/sysconfig/puppet",
        default => "/etc/sysconfig/puppet",
    }

    # TODO: Used by monitor class
    $pid_file = $operatingsystem ? {
        default => "/var/run/puppet.pid",
    }

    # TODO: Used by backup class
    $data_dir = $operatingsystem ? {
        default => "/var/lib/puppet",
    }

    # TODO: Used by backup and logrotate class
    $log_dir = $operatingsystem ? {
        default => "/var/log/puppet",
    }

    # Used by monitor and firewall class
    # If you need to define additional ports, call them
    # $protocol1/$port1 and add the relevant
    # parts in firewall.pp and monitor.pp
    $protocol = "tcp"
    $port     = "8080"

}

# vim:ft=puppet:


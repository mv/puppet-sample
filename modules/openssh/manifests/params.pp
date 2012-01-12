# Class openssh::params
#
# Sets internal variables and defaults for openssh module
# This class is loaded in all the classes that use the values set here
#
class openssh::params  {

## DEFAULTS FOR VARIABLES USERS CAN SET
# (Here are set the defaults, provide your custom variables externally)
# (The default used is in the line with '')

## Example: Full hostname of openssh server
#    $server = $openssh_server ? {
#        ''      => "openssh",
#        default => "${openssh_server}",
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
        redhat     => "openssh",
        centos     => "openssh",
        default    => "openssh",
    }

    $service_name = $operatingsystem ? {
        redhat     => "sshd",
        centos     => "sshd",
        default    => "sshd",
    }

    $process_name = $operatingsystem ? {
        default => "sshd",
    }

    $has_status = $operatingsystem ? {
        debian  => false,
        ubuntu  => false,
        default => true,
    }

    $config_dir = $operatingsystem ? {
        freebsd => "/usr/local/etc/ssh",
        redhat  => "/etc/ssh",
        centos  => "/etc/ssh",
        default => "/etc/ssh",
    }

    $config_file = $operatingsystem ? {
        default => "${config_dir}/sshd_config",
    }

#   $config_file = $operatingsystem ? {
#       freebsd => "/usr/local/etc/ssh/sshd_config",
#       redhat  => "/etc/ssh/sshd_config",
#       centos  => "/etc/ssh/sshd_config",
#       default => "/etc/ssh/sshd_config",
#   }

    $config_file_mode = $operatingsystem ? {
        default => "600",
    }

    $config_file_owner = $operatingsystem ? {
        default => "root",
    }

    $config_file_group = $operatingsystem ? {
        default => "root",
    }

    $init_config_file = $operatingsystem ? {
        debian  => "/etc/default/openssh",
        ubuntu  => "/etc/default/openssh",
        redhat  => "/etc/sysconfig/openssh",
        centos  => "/etc/sysconfig/openssh",
        default => "/etc/sysconfig/openssh",
    }

    # TODO: Used by monitor class
    $pid_file = $operatingsystem ? {
        default => "/var/run/sshd.pid",
    }

    # TODO: Used by backup class
#   $data_dir = $operatingsystem ? {
#       default => "/var/lib/sshd",
#   }

    # TODO: Used by backup and logrotate class
#   $log_dir = $operatingsystem ? {
#       default => "/var/log/ntp",
#   }

    # Used by monitor and firewall class
    # If you need to define additional ports, call them
    # $protocol1/$port1 and add the relevant
    # parts in firewall.pp and monitor.pp
    $protocol = "tcp"
    $port     = extlookup("ssh_port", "22")

}

# vim:ft=puppet:


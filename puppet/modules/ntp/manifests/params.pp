# Class ntp::params
#
# Sets internal variables and defaults for ntp module
# This class is loaded in all the classes that use the values set here
#
class ntp::params  {

## DEFAULTS FOR VARIABLES USERS CAN SET
# (Here are set the defaults, provide your custom variables externally)
# (The default used is in the line with '')

## Example: Full hostname of ntp server
#    $server = $ntp_server ? {
#        ''      => "ntp",
#        default => "${ntp_server}",
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
        redhat     => "ntp",
        centos     => "ntp",
        default    => "ntp",
    }

    $service_name = $operatingsystem ? {
        redhat     => "ntpd",
        centos     => "ntpd",
        default    => "ntpd",
    }

    $process_name = $operatingsystem ? {
        default => "ntpd",
    }

    $has_status = $operatingsystem ? {
        debian  => false,
        ubuntu  => false,
        default => true,
    }

    $config_file = $operatingsystem ? {
        freebsd => "/usr/local/etc/ntp/ntp.conf",
        redhat  => "/etc/ntp.conf",
        centos  => "/etc/ntp.conf",
        default => "/etc/ntp/ntp.conf",
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
        redhat  => "/etc/ntp.conf",
        centos  => "/etc/ntp.conf",
        default => "/etc/ntp",
    }

    $init_config_file = $operatingsystem ? {
        debian  => "/etc/default/ntp",
        ubuntu  => "/etc/default/ntp",
        redhat  => "/etc/sysconfig/ntpd",
        centos  => "/etc/sysconfig/ntpd",
        default => "/etc/sysconfig/ntp",
    }

    # TODO: Used by monitor class
    $pid_file = $operatingsystem ? {
        default => "/var/run/ntpd.pid",
    }

    # TODO: Used by backup class
    $data_dir = $operatingsystem ? {
        default => "/var/lib/ntp",
    }

    # TODO: Used by backup and logrotate class
    $log_dir = $operatingsystem ? {
        default => "/var/log/ntp",
    }

    # Used by monitor and firewall class
    # If you need to define additional ports, call them
    # $protocol1/$port1 and add the relevant
    # parts in firewall.pp and monitor.pp
    $protocol = "udp"
    $port     = "3350"

}

# vim:ft=puppet:


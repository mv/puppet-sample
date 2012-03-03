# Class snmp::params
#
# Sets internal variables and defaults for snmp module
# This class is loaded in all the classes that use the values set here
#
class snmp::params  {

## DEFAULTS FOR VARIABLES USERS CAN SET
# (Here are set the defaults, provide your custom variables externally)
# (The default used is in the line with '')

## Example: Full hostname of snmp server
#    $server = $snmp_server ? {
#        ''      => "snmp",
#        default => "${snmp_server}",
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
        redhat     => "snmp",
        centos     => "snmp",
        default    => "snmp",
    }

    $service_name = $operatingsystem ? {
        redhat     => "snmpd",
        centos     => "snmpd",
        default    => "snmpd",
    }

    $process_name = $operatingsystem ? {
        default => "snmpd",
    }

    $has_status = $operatingsystem ? {
        debian  => false,
        ubuntu  => false,
        default => true,
    }

    $config_file = $operatingsystem ? {
        freebsd => "/usr/local/etc/snmp/snmp.conf",
        redhat  => "/etc/snmp.conf",
        centos  => "/etc/snmp.conf",
        default => "/etc/snmp/snmp.conf",
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
        redhat  => "/etc/snmp.conf",
        centos  => "/etc/snmp.conf",
        default => "/etc/snmp",
    }

    $init_config_file = $operatingsystem ? {
        debian  => "/etc/default/snmp",
        ubuntu  => "/etc/default/snmp",
        redhat  => "/etc/sysconfig/snmpd",
        centos  => "/etc/sysconfig/snmpd",
        default => "/etc/sysconfig/snmp",
    }

    # TODO: Used by monitor class
    $pid_file = $operatingsystem ? {
        default => "/var/run/snmpd.pid",
    }

    # TODO: Used by backup class
    $data_dir = $operatingsystem ? {
        default => "/var/lib/snmp",
    }

    # TODO: Used by backup and logrotate class
    $log_dir = $operatingsystem ? {
        default => "/var/log/snmp",
    }

    # Used by monitor and firewall class
    # If you need to define additional ports, call them
    # $protocol1/$port1 and add the relevant
    # parts in firewall.pp and monitor.pp
    $protocol = "udp"
    $port     = "3350"

}

# vim:ft=puppet:


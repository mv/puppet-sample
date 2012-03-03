# Class snmp::puppi
#
# This class manages the puppi extensions for the snmp module
# It's automatically included and used if $puppi=yes
#
class snmp::puppi {

    puppi::info::module { "snmp":
        pkg_name     => "${snmp::params::pkg_name}",
        service_name => "${snmp::params::service_name}",
        process_name => "${snmp::params::process_name}",
        config_file  => "${snmp::params::config_file}",
        config_dir   => "${snmp::params::config_dir}",
        pid_file     => "${snmp::params::pid_file}",
        data_dir     => "${snmp::params::data_dir}",
        log_dir      => "${snmp::params::log_dir}",
        protocol     => "${snmp::params::protocol}",
        port         => "${snmp::params::port}",
        description  => "What Puppet knows about snmp" ,
        # run         => "snmp -V###",
    }

    puppi::log { "snmp":
        description => "Logs of snmp" ,
        log         => "${snmp::params::log_dir}",
    }

}

# vim:ft=puppet:


# Class snmp::monitor::absent
#
# Remove snmp monitor elements
#

class snmp::monitor::absent {

    include snmp::params

    # Port monitoring
    monitor::port { "snmp_${snmp::params::protocol}_${snmp::params::port}":
        protocol => "${snmp::params::protocol}",
        port     => "${snmp::params::port}",
        target   => "${snmp::params::monitor_target_real}",
        enable   => "false",
        tool     => "${monitor_tool}",
    }

    # URL monitoring
    monitor::url { "snmp_url":
        url      => "${snmp::params::monitor_baseurl_real}/index.php",
        pattern  => "${snmp::params::monitor_url_pattern}",
        enable   => "false",
        tool     => "${monitor_tool}",
    }

    # Process monitoring
    monitor::process { "snmp_process":
        process  => "${snmp::params::process_name}",
        service  => "${snmp::params::service_name}",
        pid_file  => "${snmp::params::pid_file}",
        enable   => "false",
        tool     => "${monitor_tool}",
    }

    # Use a specific plugin (according to the monitor tool used)
    monitor::plugin { "snmp_plugin":
        plugin   => "snmp",
        enable   => "false",
        tool     => "${monitor_tool}",
    }

}

# vim:ft=puppet:


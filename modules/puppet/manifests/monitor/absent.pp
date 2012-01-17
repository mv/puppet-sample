# Class puppet::monitor::absent
#
# Remove puppet monitor elements
#

class puppet::monitor::absent {

    include puppet::params

    # Port monitoring
    monitor::port { "puppet_${puppet::params::protocol}_${puppet::params::port}":
        protocol => "${puppet::params::protocol}",
        port     => "${puppet::params::port}",
        target   => "${puppet::params::monitor_target_real}",
        enable   => "false",
        tool     => "${monitor_tool}",
    }

    # URL monitoring
    monitor::url { "puppet_url":
        url      => "${puppet::params::monitor_baseurl_real}/index.php",
        pattern  => "${puppet::params::monitor_url_pattern}",
        enable   => "false",
        tool     => "${monitor_tool}",
    }

    # Process monitoring
    monitor::process { "puppet_process":
        process  => "${puppet::params::process_name}",
        service  => "${puppet::params::service_name}",
        pid_file  => "${puppet::params::pid_file}",
        enable   => "false",
        tool     => "${monitor_tool}",
    }

    # Use a specific plugin (according to the monitor tool used)
    monitor::plugin { "puppet_plugin":
        plugin   => "puppet",
        enable   => "false",
        tool     => "${monitor_tool}",
    }

}

# vim:ft=puppet:


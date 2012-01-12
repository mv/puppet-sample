# Class sudo::monitor::absent
#
# Remove sudo monitor elements
#

class sudo::monitor::absent {

    include sudo::params

    # Port monitoring
    monitor::port { "sudo_${sudo::params::protocol}_${sudo::params::port}":
        protocol => "${sudo::params::protocol}",
        port     => "${sudo::params::port}",
        target   => "${sudo::params::monitor_target_real}",
        enable   => "false",
        tool     => "${monitor_tool}",
    }

    # URL monitoring
    monitor::url { "sudo_url":
        url      => "${sudo::params::monitor_baseurl_real}/index.php",
        pattern  => "${sudo::params::monitor_url_pattern}",
        enable   => "false",
        tool     => "${monitor_tool}",
    }

    # Process monitoring
    monitor::process { "sudo_process":
        process  => "${sudo::params::process_name}",
        service  => "${sudo::params::service_name}",
        pid_file  => "${sudo::params::pid_file}",
        enable   => "false",
        tool     => "${monitor_tool}",
    }

    # Use a specific plugin (according to the monitor tool used)
    monitor::plugin { "sudo_plugin":
        plugin   => "sudo",
        enable   => "false",
        tool     => "${monitor_tool}",
    }

}

# vim:ft=puppet:


# Class openssh::monitor::absent
#
# Remove openssh monitor elements
#

class openssh::monitor::absent {

    include openssh::params

    # Port monitoring
    monitor::port { "openssh_${openssh::params::protocol}_${openssh::params::port}":
        protocol => "${openssh::params::protocol}",
        port     => "${openssh::params::port}",
        target   => "${openssh::params::monitor_target_real}",
        enable   => "false",
        tool     => "${monitor_tool}",
    }

    # URL monitoring
    monitor::url { "openssh_url":
        url      => "${openssh::params::monitor_baseurl_real}/index.php",
        pattern  => "${openssh::params::monitor_url_pattern}",
        enable   => "false",
        tool     => "${monitor_tool}",
    }

    # Process monitoring
    monitor::process { "openssh_process":
        process  => "${openssh::params::process_name}",
        service  => "${openssh::params::service_name}",
        pid_file  => "${openssh::params::pid_file}",
        enable   => "false",
        tool     => "${monitor_tool}",
    }

    # Use a specific plugin (according to the monitor tool used)
    monitor::plugin { "openssh_plugin":
        plugin   => "openssh",
        enable   => "false",
        tool     => "${monitor_tool}",
    }

}

# vim:ft=puppet:


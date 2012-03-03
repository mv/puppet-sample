# Class foo-pkg-service::monitor::absent
#
# Remove foo-pkg-service monitor elements
#

class foo-pkg-service::monitor::absent {

    include foo-pkg-service::params

    # Port monitoring
    monitor::port { "foo-pkg-service_${foo-pkg-service::params::protocol}_${foo-pkg-service::params::port}":
        protocol => "${foo-pkg-service::params::protocol}",
        port     => "${foo-pkg-service::params::port}",
        target   => "${foo-pkg-service::params::monitor_target_real}",
        enable   => "false",
        tool     => "${monitor_tool}",
    }

    # URL monitoring
    monitor::url { "foo-pkg-service_url":
        url      => "${foo-pkg-service::params::monitor_baseurl_real}/index.php",
        pattern  => "${foo-pkg-service::params::monitor_url_pattern}",
        enable   => "false",
        tool     => "${monitor_tool}",
    }

    # Process monitoring
    monitor::process { "foo-pkg-service_process":
        process  => "${foo-pkg-service::params::process_name}",
        service  => "${foo-pkg-service::params::service_name}",
        pid_file  => "${foo-pkg-service::params::pid_file}",
        enable   => "false",
        tool     => "${monitor_tool}",
    }

    # Use a specific plugin (according to the monitor tool used)
    monitor::plugin { "foo-pkg-service_plugin":
        plugin   => "foo-pkg-service",
        enable   => "false",
        tool     => "${monitor_tool}",
    }

}

# vim:ft=puppet:


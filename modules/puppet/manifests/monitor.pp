# Class puppet::monitor
#
# Monitors puppet process/ports/service using Example42 monitor meta module (to be adapted to custom monitor solutions)
#
# It's automatically included and used if $monitor=yes and is defined at least one monitoring software in $monitor_tool
#
# This class permits to abstract what you want to monitor from the actual tool and modules you'll use for monitoring
# and can be used to quickly deploy a new monitoring solution that instantly notifies what's working and what's needs
# to be fixed (call it Test Driven Puppet Deployment, if you like ;-)
#
# Variables:
#
# The behaviour of this class has some defaults that can be overriden by user's variables:
#
#   $puppet_monitor_port    (true|false) : Set if you want to monitor puppet's port(s). If any.
#                                       Default: As defined in $monitor_port
#   $puppet_monitor_url     (true|false) : Set if you want to monitor puppet's url(s).  If any.
#                                       Default: As defined in $monitor_url
#   $puppet_monitor_process (true|false) : Set if you want to monitor puppet's process. If any.
#                                       Default: As defined in $monitor_process
#   $puppet_monitor_plugin  (true|false) : Set if you want to monitor puppet using specific monitor tool's plugin. If any.
#                                       Default: As defined in $monitor_plugin
#   $puppet_monitor_target               : Define how to reach (Ip, fqdn...) the host to monitor puppet from an external server.
#                                       Default: As defined in $monitor_target
#   $puppet_monitor_url                  : Define the baseurl (http://$fqdn/...) to use for eventual puppet URL checks.
#                                       Default: As defined in $monitor_url
#
# You can therefore set site wide variables that can be overriden by the above module specific ones:
#
#   $monitor_port    (true|false) : Set if you want to enable port monitoring site-wide.
#   $monitor_url     (true|false) : Set if you want to enable url checking site-wide.
#   $monitor_process (true|false) : Set if you want to enable process monitoring site-wide.
#   $monitor_plugin  (true|false) : Set if you want to try to use specific plugins of your monitoring tools.
#   $monitor_target               : Set the ip/hostname you want to use on an external monitoring server to monitor this host.
#   $monitor_baseurl              : Set baseurl to use for eventual URL checks of services provided by this host.
#
# For the defaults of the above variables check puppet::params
#
# Usage:
#     Automatically included if $monitor=yes
#     Use the variable $monitor_tool (can be an array) to define the monitoring software you want to use.
#     To customize specific and more granular behaviours use the above variables and eventually your custom modulename::monitor::$my_project class
#

class puppet::monitor {

    include puppet::params

    # Port monitoring
    monitor::port { "puppet_${puppet::params::protocol}_${puppet::params::port}":
        protocol => "${puppet::params::protocol}",
        port     => "${puppet::params::port}",
        target   => "${puppet::params::monitor_target_real}",
        enable   => "${puppet::params::monitor_port_enable}",
        tool     => "${monitor_tool}",
    }

    # URL monitoring
    monitor::url { "puppet_url":
        url      => "${puppet::params::monitor_baseurl_real}/index.php",
        pattern  => "${puppet::params::monitor_url_pattern}",
        enable   => "${puppet::params::monitor_url_enable}",
        tool     => "${monitor_tool}",
    }

    # Process monitoring
    monitor::process { "puppet_process":
        process  => "${puppet::params::process_name}",
        service  => "${puppet::params::service_name}",
        pid_file => "${puppet::params::pid_file}",
        enable   => "${puppet::params::monitor_process_enable}",
        tool     => "${monitor_tool}",
    }

    # Use a specific plugin (according to the monitor tool used)
    monitor::plugin { "puppet_plugin":
        plugin   => "puppet",
        enable   => "${puppet::params::monitor_plugin_enable}",
        tool     => "${monitor_tool}",
    }

    # Include project specific monitor class if $my_project is set
    if $my_project { include "puppet::${my_project}::monitor" }

}

# vim:ft=puppet:


# Class puppet::monitor::params
#
# Sets internal variables and defaults for puppet module
# This class is loaded in all the classes that use the values set here
#
class puppet::monitor::params  {

### DEFAULTS FOR MONITOR CLASS

# These are settings that influence the (optional) puppet::monitor class
# You can define these variables or leave the defaults
# The apparently complex variables assignements below follow this logic:
# - If no user variable is set, a reasonable default is used
# - If the user has set a host-wide variable (ex: $monitor_target ) that one is set
# - The host-wide variable can be overriden by a module specific one (ex: $puppet_monitor_target)

    # How the monitor server refers to the monitor target
    $monitor_target_real = $puppet_monitor_target ? {
           ''      => $monitor_target ? {
           ''      => "${fqdn}",
           default => $monitor_target,
        },
        default => "$puppet_monitor_target",
    }

    # BaseUrl to access this service
    $monitor_baseurl_real = $puppet_monitor_baseurl ? {
           ''      => $monitor_baseurl ? {
           ''      => "http://${fqdn}",
           default => $monitor_baseurl,
        },
        default => "${puppet_monitor_baseurl}",
    }

    # Pattern to look for in the URL defined in puppet::monitor class
    $monitor_url_pattern = $puppet_monitor_url_pattern ? {
        ''      => "OK",
        default => "${puppet_monitor_url_pattern}",
    }

    # If puppet port monitoring is enabled
    $monitor_port_enable = $puppet_monitor_port ? {
        ''      => $monitor_port ? {
           ''      => true,
           default => $monitor_port,
        },
        default => $puppet_monitor_port,
    }

    # If puppet url monitoring is enabled
    $monitor_url_enable = $puppet_monitor_url ? {
        ''      => $monitor_url ? {
           ''      => false,
           default => $monitor_url,
        },
        default => $puppet_monitor_url,
    }

    # If puppet process monitoring is enabled
    $monitor_process_enable = $puppet_monitor_process ? {
           ''      => $monitor_process ? {
           ''      => true,
           default => $monitor_process,
        },
        default => $puppet_monitor_process,
    }

    # If puppet plugin monitoring is enabled
    $monitor_plugin_enable = $puppet_monitor_plugin ? {
           ''      => $monitor_plugin ? {
           ''      => false,
           default => $monitor_plugin,
        },
        default => $puppet_monitor_plugin,
    }

}

# vim:ft=puppet:


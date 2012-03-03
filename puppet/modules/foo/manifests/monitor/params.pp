# Class foo::monitor::params
#
# Sets internal variables and defaults for foo module
# This class is loaded in all the classes that use the values set here
#
class foo::monitor::params  {

### DEFAULTS FOR MONITOR CLASS

# These are settings that influence the (optional) foo::monitor class
# You can define these variables or leave the defaults
# The apparently complex variables assignements below follow this logic:
# - If no user variable is set, a reasonable default is used
# - If the user has set a host-wide variable (ex: $monitor_target ) that one is set
# - The host-wide variable can be overriden by a module specific one (ex: $foo_monitor_target)

    # How the monitor server refers to the monitor target
    $monitor_target_real = $foo_monitor_target ? {
           ''      => $monitor_target ? {
           ''      => "${fqdn}",
           default => $monitor_target,
        },
        default => "$foo_monitor_target",
    }

    # BaseUrl to access this service
    $monitor_baseurl_real = $foo_monitor_baseurl ? {
           ''      => $monitor_baseurl ? {
           ''      => "http://${fqdn}",
           default => $monitor_baseurl,
        },
        default => "${foo_monitor_baseurl}",
    }

    # Pattern to look for in the URL defined in foo::monitor class
    $monitor_url_pattern = $foo_monitor_url_pattern ? {
        ''      => "OK",
        default => "${foo_monitor_url_pattern}",
    }

    # If foo port monitoring is enabled
    $monitor_port_enable = $foo_monitor_port ? {
        ''      => $monitor_port ? {
           ''      => true,
           default => $monitor_port,
        },
        default => $foo_monitor_port,
    }

    # If foo url monitoring is enabled
    $monitor_url_enable = $foo_monitor_url ? {
        ''      => $monitor_url ? {
           ''      => false,
           default => $monitor_url,
        },
        default => $foo_monitor_url,
    }

    # If foo process monitoring is enabled
    $monitor_process_enable = $foo_monitor_process ? {
           ''      => $monitor_process ? {
           ''      => true,
           default => $monitor_process,
        },
        default => $foo_monitor_process,
    }

    # If foo plugin monitoring is enabled
    $monitor_plugin_enable = $foo_monitor_plugin ? {
           ''      => $monitor_plugin ? {
           ''      => false,
           default => $monitor_plugin,
        },
        default => $foo_monitor_plugin,
    }

}

# vim:ft=puppet:


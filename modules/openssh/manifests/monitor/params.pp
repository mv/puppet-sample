# Class openssh::monitor::params
#
# Sets internal variables and defaults for openssh module
# This class is loaded in all the classes that use the values set here
#
class openssh::monitor::params  {

### DEFAULTS FOR MONITOR CLASS

# These are settings that influence the (optional) openssh::monitor class
# You can define these variables or leave the defaults
# The apparently complex variables assignements below follow this logic:
# - If no user variable is set, a reasonable default is used
# - If the user has set a host-wide variable (ex: $monitor_target ) that one is set
# - The host-wide variable can be overriden by a module specific one (ex: $openssh_monitor_target)

    # How the monitor server refers to the monitor target
    $monitor_target_real = $openssh_monitor_target ? {
           ''      => $monitor_target ? {
           ''      => "${fqdn}",
           default => $monitor_target,
        },
        default => "$openssh_monitor_target",
    }

    # BaseUrl to access this service
    $monitor_baseurl_real = $openssh_monitor_baseurl ? {
           ''      => $monitor_baseurl ? {
           ''      => "http://${fqdn}",
           default => $monitor_baseurl,
        },
        default => "${openssh_monitor_baseurl}",
    }

    # Pattern to look for in the URL defined in openssh::monitor class
    $monitor_url_pattern = $openssh_monitor_url_pattern ? {
        ''      => "OK",
        default => "${openssh_monitor_url_pattern}",
    }

    # If openssh port monitoring is enabled
    $monitor_port_enable = $openssh_monitor_port ? {
        ''      => $monitor_port ? {
           ''      => true,
           default => $monitor_port,
        },
        default => $openssh_monitor_port,
    }

    # If openssh url monitoring is enabled
    $monitor_url_enable = $openssh_monitor_url ? {
        ''      => $monitor_url ? {
           ''      => false,
           default => $monitor_url,
        },
        default => $openssh_monitor_url,
    }

    # If openssh process monitoring is enabled
    $monitor_process_enable = $openssh_monitor_process ? {
           ''      => $monitor_process ? {
           ''      => true,
           default => $monitor_process,
        },
        default => $openssh_monitor_process,
    }

    # If openssh plugin monitoring is enabled
    $monitor_plugin_enable = $openssh_monitor_plugin ? {
           ''      => $monitor_plugin ? {
           ''      => false,
           default => $monitor_plugin,
        },
        default => $openssh_monitor_plugin,
    }

}

# vim:ft=puppet:


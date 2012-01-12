# Class ntp::monitor::params
#
# Sets internal variables and defaults for ntp module
# This class is loaded in all the classes that use the values set here
#
class ntp::monitor::params  {

### DEFAULTS FOR MONITOR CLASS

# These are settings that influence the (optional) ntp::monitor class
# You can define these variables or leave the defaults
# The apparently complex variables assignements below follow this logic:
# - If no user variable is set, a reasonable default is used
# - If the user has set a host-wide variable (ex: $monitor_target ) that one is set
# - The host-wide variable can be overriden by a module specific one (ex: $ntp_monitor_target)

    # How the monitor server refers to the monitor target
    $monitor_target_real = $ntp_monitor_target ? {
           ''      => $monitor_target ? {
           ''      => "${fqdn}",
           default => $monitor_target,
        },
        default => "$ntp_monitor_target",
    }

    # BaseUrl to access this service
    $monitor_baseurl_real = $ntp_monitor_baseurl ? {
           ''      => $monitor_baseurl ? {
           ''      => "http://${fqdn}",
           default => $monitor_baseurl,
        },
        default => "${ntp_monitor_baseurl}",
    }

    # Pattern to look for in the URL defined in ntp::monitor class
    $monitor_url_pattern = $ntp_monitor_url_pattern ? {
        ''      => "OK",
        default => "${ntp_monitor_url_pattern}",
    }

    # If ntp port monitoring is enabled
    $monitor_port_enable = $ntp_monitor_port ? {
        ''      => $monitor_port ? {
           ''      => true,
           default => $monitor_port,
        },
        default => $ntp_monitor_port,
    }

    # If ntp url monitoring is enabled
    $monitor_url_enable = $ntp_monitor_url ? {
        ''      => $monitor_url ? {
           ''      => false,
           default => $monitor_url,
        },
        default => $ntp_monitor_url,
    }

    # If ntp process monitoring is enabled
    $monitor_process_enable = $ntp_monitor_process ? {
           ''      => $monitor_process ? {
           ''      => true,
           default => $monitor_process,
        },
        default => $ntp_monitor_process,
    }

    # If ntp plugin monitoring is enabled
    $monitor_plugin_enable = $ntp_monitor_plugin ? {
           ''      => $monitor_plugin ? {
           ''      => false,
           default => $monitor_plugin,
        },
        default => $ntp_monitor_plugin,
    }

}

# vim:ft=puppet:


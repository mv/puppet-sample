# Class snmp::monitor::params
#
# Sets internal variables and defaults for snmp module
# This class is loaded in all the classes that use the values set here
#
class snmp::monitor::params  {

### DEFAULTS FOR MONITOR CLASS

# These are settings that influence the (optional) snmp::monitor class
# You can define these variables or leave the defaults
# The apparently complex variables assignements below follow this logic:
# - If no user variable is set, a reasonable default is used
# - If the user has set a host-wide variable (ex: $monitor_target ) that one is set
# - The host-wide variable can be overriden by a module specific one (ex: $snmp_monitor_target)

    # How the monitor server refers to the monitor target
    $monitor_target_real = $snmp_monitor_target ? {
           ''      => $monitor_target ? {
           ''      => "${fqdn}",
           default => $monitor_target,
        },
        default => "$snmp_monitor_target",
    }

    # BaseUrl to access this service
    $monitor_baseurl_real = $snmp_monitor_baseurl ? {
           ''      => $monitor_baseurl ? {
           ''      => "http://${fqdn}",
           default => $monitor_baseurl,
        },
        default => "${snmp_monitor_baseurl}",
    }

    # Pattern to look for in the URL defined in snmp::monitor class
    $monitor_url_pattern = $snmp_monitor_url_pattern ? {
        ''      => "OK",
        default => "${snmp_monitor_url_pattern}",
    }

    # If snmp port monitoring is enabled
    $monitor_port_enable = $snmp_monitor_port ? {
        ''      => $monitor_port ? {
           ''      => true,
           default => $monitor_port,
        },
        default => $snmp_monitor_port,
    }

    # If snmp url monitoring is enabled
    $monitor_url_enable = $snmp_monitor_url ? {
        ''      => $monitor_url ? {
           ''      => false,
           default => $monitor_url,
        },
        default => $snmp_monitor_url,
    }

    # If snmp process monitoring is enabled
    $monitor_process_enable = $snmp_monitor_process ? {
           ''      => $monitor_process ? {
           ''      => true,
           default => $monitor_process,
        },
        default => $snmp_monitor_process,
    }

    # If snmp plugin monitoring is enabled
    $monitor_plugin_enable = $snmp_monitor_plugin ? {
           ''      => $monitor_plugin ? {
           ''      => false,
           default => $monitor_plugin,
        },
        default => $snmp_monitor_plugin,
    }

}

# vim:ft=puppet:


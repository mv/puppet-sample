# Class puppet::backup::absent
#
# Remove puppet backup elements
#

class puppet::backup::absent {

    include puppet::params

    backup { "puppet_data":
        frequency => "${puppet::params::backup_frequency}",
        path      => "${puppet::params::data_dir}",
        enabled   => "false",
        target    => "${puppet::params::backup_target_real}",
    }

    backup { "puppet_logs":
        frequency => "${puppet::params::backup_frequency}",
        path      => "${puppet::params::log_dir}",
        enabled   => "false",
        target    => "${puppet::params::backup_target_real}",
    }

}

# vim:ft=puppet:


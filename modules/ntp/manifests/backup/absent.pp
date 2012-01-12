# Class ntp::backup::absent
#
# Remove ntp backup elements
#

class ntp::backup::absent {

    include ntp::params

    backup { "ntp_data":
        frequency => "${ntp::params::backup_frequency}",
        path      => "${ntp::params::data_dir}",
        enabled   => "false",
        target    => "${ntp::params::backup_target_real}",
    }

    backup { "ntp_logs":
        frequency => "${ntp::params::backup_frequency}",
        path      => "${ntp::params::log_dir}",
        enabled   => "false",
        target    => "${ntp::params::backup_target_real}",
    }

}

# vim:ft=puppet:


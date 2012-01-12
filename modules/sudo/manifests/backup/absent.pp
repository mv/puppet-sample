# Class sudo::backup::absent
#
# Remove sudo backup elements
#

class sudo::backup::absent {

    include sudo::params

    backup { "sudo_data":
        frequency => "${sudo::params::backup_frequency}",
        path      => "${sudo::params::data_dir}",
        enabled   => "false",
        target    => "${sudo::params::backup_target_real}",
    }

    backup { "sudo_logs":
        frequency => "${sudo::params::backup_frequency}",
        path      => "${sudo::params::log_dir}",
        enabled   => "false",
        target    => "${sudo::params::backup_target_real}",
    }

}

# vim:ft=puppet:


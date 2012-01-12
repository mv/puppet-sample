# Class openssh::backup::absent
#
# Remove openssh backup elements
#

class openssh::backup::absent {

    include openssh::params

    backup { "openssh_data":
        frequency => "${openssh::params::backup_frequency}",
        path      => "${openssh::params::data_dir}",
        enabled   => "false",
        target    => "${openssh::params::backup_target_real}",
    }

    backup { "openssh_logs":
        frequency => "${openssh::params::backup_frequency}",
        path      => "${openssh::params::log_dir}",
        enabled   => "false",
        target    => "${openssh::params::backup_target_real}",
    }

}

# vim:ft=puppet:


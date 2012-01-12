# Class sudo::backup::params
#
# Sets internal variables and defaults for sudo module
# This class is loaded in all the classes that use the values set here
#
class sudo::backup::params  {



### DEFAULTS FOR BACKUP CLASS

# These are settings that influence the (optional) sudo::backup class
# You can define these variables or leave the defaults

    # How the backup server refers to the backup target
    $backup_target_real = $sudo_backup_target ? {
           ''      => $backup_target ? {
           ''      => "${fqdn}",
           default => $backup_target,
        },
        default => "$sudo_backup_target",
    }

    # Frequency of backups
    $backup_frequency = $sudo_backup_frequency ? {
        ''      => "daily",
        default => "$sudo_backup_frequency",
    }

    # If sudo data have to be backed up
    $backup_data_enable = $sudo_backup_data ? {
           ''      => $backup_data ? {
           ''      => true,
           default => $backup_data,
        },
        default => $sudo_backup_data,
    }

    # If sudo logs have to be backed up
    $backup_log_enable = $sudo_backup_log ? {
           ''      => $backup_log ? {
           ''      => false,
           default => $backup_log,
        },
        default => $sudo_backup_log,
    }

}

# vim:ft=puppet:


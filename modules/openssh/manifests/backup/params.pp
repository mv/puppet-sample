# Class openssh::backup::params
#
# Sets internal variables and defaults for openssh module
# This class is loaded in all the classes that use the values set here
#
class openssh::backup::params  {



### DEFAULTS FOR BACKUP CLASS

# These are settings that influence the (optional) openssh::backup class
# You can define these variables or leave the defaults

    # How the backup server refers to the backup target
    $backup_target_real = $openssh_backup_target ? {
           ''      => $backup_target ? {
           ''      => "${fqdn}",
           default => $backup_target,
        },
        default => "$openssh_backup_target",
    }

    # Frequency of backups
    $backup_frequency = $openssh_backup_frequency ? {
        ''      => "daily",
        default => "$openssh_backup_frequency",
    }

    # If openssh data have to be backed up
    $backup_data_enable = $openssh_backup_data ? {
           ''      => $backup_data ? {
           ''      => true,
           default => $backup_data,
        },
        default => $openssh_backup_data,
    }

    # If openssh logs have to be backed up
    $backup_log_enable = $openssh_backup_log ? {
           ''      => $backup_log ? {
           ''      => false,
           default => $backup_log,
        },
        default => $openssh_backup_log,
    }

}

# vim:ft=puppet:


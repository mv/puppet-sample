# Class puppet::backup::params
#
# Sets internal variables and defaults for puppet module
# This class is loaded in all the classes that use the values set here
#
class puppet::backup::params  {



### DEFAULTS FOR BACKUP CLASS

# These are settings that influence the (optional) puppet::backup class
# You can define these variables or leave the defaults

    # How the backup server refers to the backup target
    $backup_target_real = $puppet_backup_target ? {
           ''      => $backup_target ? {
           ''      => "${fqdn}",
           default => $backup_target,
        },
        default => "$puppet_backup_target",
    }

    # Frequency of backups
    $backup_frequency = $puppet_backup_frequency ? {
        ''      => "daily",
        default => "$puppet_backup_frequency",
    }

    # If puppet data have to be backed up
    $backup_data_enable = $puppet_backup_data ? {
           ''      => $backup_data ? {
           ''      => true,
           default => $backup_data,
        },
        default => $puppet_backup_data,
    }

    # If puppet logs have to be backed up
    $backup_log_enable = $puppet_backup_log ? {
           ''      => $backup_log ? {
           ''      => false,
           default => $backup_log,
        },
        default => $puppet_backup_log,
    }

}

# vim:ft=puppet:


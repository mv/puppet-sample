# Class ntp::backup::params
#
# Sets internal variables and defaults for ntp module
# This class is loaded in all the classes that use the values set here
#
class ntp::backup::params  {


    $data_dir = $operatingsystem ? {
        default => "/var/lib/ntp",
    }


### DEFAULTS FOR BACKUP CLASS

# These are settings that influence the (optional) ntp::backup class
# You can define these variables or leave the defaults

    # How the backup server refers to the backup target
    $backup_target_real = $ntp_backup_target ? {
           ''      => $backup_target ? {
           ''      => "${fqdn}",
           default => $backup_target,
        },
        default => "$ntp_backup_target",
    }

    # Frequency of backups
    $backup_frequency = $ntp_backup_frequency ? {
        ''      => "daily",
        default => "$ntp_backup_frequency",
    }

    # If ntp data have to be backed up
    $backup_data_enable = $ntp_backup_data ? {
           ''      => $backup_data ? {
           ''      => true,
           default => $backup_data,
        },
        default => $ntp_backup_data,
    }

    # If ntp logs have to be backed up
    $backup_log_enable = $ntp_backup_log ? {
           ''      => $backup_log ? {
           ''      => false,
           default => $backup_log,
        },
        default => $ntp_backup_log,
    }

}

# vim:ft=puppet:


# Class foo::backup::params
#
# Sets internal variables and defaults for foo module
# This class is loaded in all the classes that use the values set here
#
class foo::backup::params  {


    $data_dir = $operatingsystem ? {
        default => "/var/lib/foo",
    }


### DEFAULTS FOR BACKUP CLASS

# These are settings that influence the (optional) foo::backup class
# You can define these variables or leave the defaults

    # How the backup server refers to the backup target
    $backup_target_real = $foo_backup_target ? {
           ''      => $backup_target ? {
           ''      => "${fqdn}",
           default => $backup_target,
        },
        default => "$foo_backup_target",
    }

    # Frequency of backups
    $backup_frequency = $foo_backup_frequency ? {
        ''      => "daily",
        default => "$foo_backup_frequency",
    }

    # If foo data have to be backed up
    $backup_data_enable = $foo_backup_data ? {
           ''      => $backup_data ? {
           ''      => true,
           default => $backup_data,
        },
        default => $foo_backup_data,
    }

    # If foo logs have to be backed up
    $backup_log_enable = $foo_backup_log ? {
           ''      => $backup_log ? {
           ''      => false,
           default => $backup_log,
        },
        default => $foo_backup_log,
    }

}

# vim:ft=puppet:


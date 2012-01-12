# Class sudo::backup
#
# Backups sudo data and logs using Example42 backup meta module (to be adapted to custom backup solutions)
#
# It's automatically included and used if $backup=yes
#
# This class permits to abstract what you want to backup from the tool and module to use for backups.
#
# Variables:
#
# The behaviour of this class has some defaults that can be overriden by user's variables:
#
# $sudo_backup_data (true|false) :
#     Set if you want to backup sudo's data. Default: As defined in $backup_data
#
# $sudo_backup_log (true|false) :
#     Set if you want to backup sudo's logs. Default: As defined in $backup_log
#
# $sudo_backup_frequency (hourly|daily|weekly|monthly) :
#     Set the frequency of your sudo backups. Default: daily.
#
# $sudo_backup_target :
#     Define how to reach (Ip, fqdn...) this host to backup sudo from an external server.
#     Default: As defined in $backup_target
#
# You can also set some site wide variables that can be overriden by the above module specific ones:
#
# $backup_data (true|false) : Set if you want to enable data backups site-wide.
# $backup_log  (true|false) : Set if you want to enable logs backups site-wide.
# $backup_target            : Set the ip/hostname you want to use on an external backup server to backup this host
#
# For the defaults of the above variables check sudo::params
#
# Usage:
# Automatically included if $backup=yes
#

class sudo::backup {

    include sudo::params

    backup { "sudo_data":
        frequency => "${sudo::params::backup_frequency}",
        path      => "${sudo::params::data_dir}",
        enabled   => "${sudo::params::backup_data_enable}",
        target    => "${sudo::params::backup_target_real}",
    }

    backup { "sudo_logs":
        frequency => "${sudo::params::backup_frequency}",
        path      => "${sudo::params::log_dir}",
        enabled   => "${sudo::params::backup_log_enable}",
        target    => "${sudo::params::backup_target_real}",
    }

    # Include project specific backup class if $my_project is set
    if $my_project { include "sudo::${my_project}::backup" }

}

# vim:ft=puppet:


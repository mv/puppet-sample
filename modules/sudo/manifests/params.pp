# Class sudo::params
#
# Sets internal variables and defaults for sudo module
# This class is loaded in all the classes that use the values set here
#
class sudo::params  {

## DEFAULTS FOR VARIABLES USERS CAN SET
# (Here are set the defaults, provide your custom variables externally)
# (The default used is in the line with '')

## Example: Full hostname of sudo server
#    $server = $sudo_server ? {
#        ''      => "sudo",
#        default => "${sudo_server}",
#    }


###
### EXTRA MODULE INTERNAL VARIABLES
###
# (add here module specific internal variables)



###
### MODULE INTERNAL VARIABLES
###
# (Modify to adapt to unsupported OSes)

    $pkg_name = $operatingsystem ? {
        redhat     => "sudo",
        centos     => "sudo",
        default    => "sudo",
    }

    $config_dir = $operatingsystem ? {
        default => "/etc/",
    }

    $config_file = $operatingsystem ? {
        freebsd => "/usr/local/etc/sudoers",
        default => "/etc/sudoers",
    }

    $config_file_mode = $operatingsystem ? {
        default => "440",
    }

    $config_file_owner = $operatingsystem ? {
        default => "root",
    }

    $config_file_group = $operatingsystem ? {
        default => "root",
    }

}

# vim:ft=puppet:


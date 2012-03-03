# Class foo-pkg::params
#
# Sets internal variables and defaults for foo-pkg module
# This class is loaded in all the classes that use the values set here
#
class foo-pkg::params  {

## DEFAULTS FOR VARIABLES USERS CAN SET
# (Here are set the defaults, provide your custom variables externally)
# (The default used is in the line with '')

## Example: Full hostname of foo-pkg server
#    $server = $foo-pkg_server ? {
#        ''      => "foo-pkg",
#        default => "${foo-pkg_server}",
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
        redhat     => "foo-pkg",
        centos     => "foo-pkg",
        default    => "foo-pkg",
    }

    $config_dir = $operatingsystem ? {
        default => "/etc/",
    }

    $config_file = $operatingsystem ? {
        freebsd => "/usr/local/etc/foo-pkgers",
        default => "/etc/foo-pkgers",
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


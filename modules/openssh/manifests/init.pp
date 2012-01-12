#
# Class openssh
#
# Manages openssh.
# Include it to install and run openssh
# It defines package, service, main configuration file.
#
# Usage:
# include openssh
#

class openssh {

    # Load variables defined in params.pp file.
    require openssh::params

    # Default action: install
    require openssh::install

}

# vim:ft=puppet:


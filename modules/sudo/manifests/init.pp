#
# Class sudo
#
# Manages sudo.
# Include it to install and run sudo
# It defines package, service, main configuration file.
#
# Usage:
# include sudo
#

class sudo {

    # Load variables defined in params.pp file.
    require sudo::params

    # Default action: install
    include sudo::install

}

# vim:ft=puppet:


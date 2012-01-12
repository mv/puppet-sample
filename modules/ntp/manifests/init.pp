#
# Class: ntp
#
# Manages ntp.
# Include it to install and run ntp
# It defines package, service, main configuration file.
#
# Usage:
# include ntp
#

class ntp {

    # Load variables defined in params.pp file.
    require ntp::params

    # Default action: install
    require ntp::install

}

# vim:ft=puppet:


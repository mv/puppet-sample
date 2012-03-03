#
# Class dev-libs
#
# Manages dev-libs.
# Include it to install and run dev-libs
# It defines package, service, main configuration file.
#
# Usage:
# include dev-libs
#

class dev-libs {

    # Load variables defined in params.pp file.
    require dev-libs::params

    # Default action: install
    include dev-libs::install

}

# vim:ft=puppet:


#
# Class devel2
#
# Manages devel2.
# Include it to install and run devel2
# It defines package, service, main configuration file.
#
# Usage:
# include devel2
#

class devel2 {

    # Load variables defined in params.pp file.
    require devel2::params

    # Default action: install
    include devel2::install

}

# vim:ft=puppet:


#
# Class devel
#
# Manages devel.
# Include it to install and run devel
# It defines package, service, main configuration file.
#
# Usage:
# include devel
#

class devel {

    # Load variables defined in params.pp file.
    require devel::params

    # Default action: install
    include devel::install

}

# vim:ft=puppet:


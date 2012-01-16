#
# Class devel3
#
# Manages devel3.
# Include it to install and run devel3
# It defines package, service, main configuration file.
#
# Usage:
# include devel3
#

class devel3 {

    # Load variables defined in params.pp file.
    require devel3::params

    # Default action: install
    include devel3::install

}

# vim:ft=puppet:


#
# Class foo-pkg
#
# Manages foo-pkg.
# Include it to install and run foo-pkg
# It defines package, service, main configuration file.
#
# Usage:
# include foo-pkg
#

class foo-pkg {

    # Load variables defined in params.pp file.
    require foo-pkg::params

    # Default action: install
    include foo-pkg::install

}

# vim:ft=puppet:


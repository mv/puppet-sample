#
# Class foo-pkg-service
#
# Manages foo-pkg-service.
# Include it to install and run foo-pkg-service
# It defines package, service, main configuration file.
#
# Usage:
# include foo-pkg-service
#

class foo-pkg-service {

    # Load variables defined in params.pp file.
    require foo-pkg-service::params

    # Default action: install
    include foo-pkg-service::install

}

# vim:ft=puppet:


#
# Class tools-dev
#
# Manages tools-dev.
# Include it to install and run tools-dev
# It defines package, service, main configuration file.
#
# Usage:
# include tools-dev
#

class tools-dev {

    # Load variables defined in params.pp file.
    require tools-dev::params

    # Default action: install
    include tools-dev::install

}

# vim:ft=puppet:


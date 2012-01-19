#
# Class tools-util
#
# Manages tools-util.
# Include it to install and run tools-util
# It defines package, service, main configuration file.
#
# Usage:
# include tools-util
#

class tools-util {

    # Load variables defined in params.pp file.
    require tools-util::params

    # Default action: install
    include tools-util::install

}

# vim:ft=puppet:


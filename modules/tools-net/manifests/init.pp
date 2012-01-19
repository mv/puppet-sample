#
# Class tools-net
#
# Manages tools-net.
# Include it to install and run tools-net
# It defines package, service, main configuration file.
#
# Usage:
# include tools-net
#

class tools-net {

    # Load variables defined in params.pp file.
    require tools-net::params

    # Default action: install
    include tools-net::install

}

# vim:ft=puppet:


#
# Class puppet
#
# Manages puppet.
# Include it to install and run puppet
# It defines package, service, main configuration file.
#
# Usage:
# include puppet
#

class puppet {

    # Load variables defined in params.pp file.
    require puppet::params

    # Default action: install
    include puppet::install

}

# vim:ft=puppet:


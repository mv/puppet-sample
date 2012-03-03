#
# Class htop
#
# Manages htop.
# Include it to install and run htop
# It defines package, service, main configuration file.
#
# Usage:
# include htop
#

class htop {

    # Default action: install
    include htop::install

}

# vim:ft=puppet:


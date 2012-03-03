# Class dev-libs::remove
#
# Removes dev-libs package and its relevant monitor, backup, firewall entries
#
# Usage:
# include dev-libs::remove
#

class dev-libs::remove {

    # wrapper
    require dev-libs::absent

}

# vim:ft=puppet:


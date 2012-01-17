# Class puppet::remove
#
# Removes puppet package and its relevant monitor, backup, firewall entries
#
# Usage:
# include puppet::remove
#

class puppet::remove {

    # wrapper: calls puppet::absent
    require puppet::absent

}

# vim:ft=puppet:


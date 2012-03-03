# Class htop::remove
#
# Removes htop package and its relevant monitor, backup, firewall entries
#
# Usage:
# include htop::remove
#

class htop::remove {

    # wrapper: calls htop::absent
    require htop::absent

}

# vim:ft=puppet:


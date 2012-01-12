# Class sudo::remove
#
# Removes sudo package and its relevant monitor, backup, firewall entries
#
# Usage:
# include sudo::remove
#

class sudo::remove {

    # wrapper: calls sudo::absent
    require sudo::absent

}

# vim:ft=puppet:


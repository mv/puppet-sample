# Class tools-util::remove
#
# Removes tools-util package and its relevant monitor, backup, firewall entries
#
# Usage:
# include tools-util::remove
#

class tools-util::remove {

    # wrapper
    require tools-util::absent

}

# vim:ft=puppet:


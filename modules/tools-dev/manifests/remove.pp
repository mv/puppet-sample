# Class tools-dev::remove
#
# Removes tools-dev package and its relevant monitor, backup, firewall entries
#
# Usage:
# include tools-dev::remove
#

class tools-dev::remove {

    # wrapper
    require tools-dev::absent

}

# vim:ft=puppet:


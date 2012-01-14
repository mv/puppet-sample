# Class devel::remove
#
# Removes devel package and its relevant monitor, backup, firewall entries
#
# Usage:
# include devel::remove
#

class devel::remove {

    # wrapper
    require devel::absent

}

# vim:ft=puppet:


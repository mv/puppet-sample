# Class openssh::remove
#
# Removes openssh package and its relevant monitor, backup, firewall entries
#
# Usage:
# include openssh::remove
#

class openssh::remove {

    # wrapper: calls openssh::absent
    require openssh::absent

}

# vim:ft=puppet:


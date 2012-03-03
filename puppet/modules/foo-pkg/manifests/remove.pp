# Class foo-pkg::remove
#
# Removes foo-pkg package and its relevant monitor, backup, firewall entries
#
# Usage:
# include foo-pkg::remove
#

class foo-pkg::remove {

    # wrapper: calls foo-pkg::absent
    require foo-pkg::absent

}

# vim:ft=puppet:


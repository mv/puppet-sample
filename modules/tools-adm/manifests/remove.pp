# Class tools-adm::remove
#
# Removes tools-adm package and its relevant monitor, backup, firewall entries
#
# Usage:
# include tools-adm::remove
#

class tools-adm::remove {

    # wrapper
    require tools-adm::absent

}

# vim:ft=puppet:


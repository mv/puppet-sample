# Class htop::absent
#
# Removes htop package and its relevant monitor, backup, firewall entries
#
# Usage:
# include htop::absent
#

class htop::absent {

    package { "htop":
        ensure => absent,
    }

}

# vim:ft=puppet:


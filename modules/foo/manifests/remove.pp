# Class: foo::remove
#
# Removes foo package and its relevant monitor, backup, firewall entries
#
# Usage:
# include foo::remove
#

class foo::remove {

	# wrapper: calls foo::absent
    require foo::absent

}

# vim:ft=puppet:


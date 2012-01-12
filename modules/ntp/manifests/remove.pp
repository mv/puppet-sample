# Class: ntp::remove
#
# Removes ntp package and its relevant monitor, backup, firewall entries
#
# Usage:
# include ntp::remove
#

class ntp::remove {

	# wrapper: calls ntp::absent
    require ntp::absent

}

# vim:ft=puppet:


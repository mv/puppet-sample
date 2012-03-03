# Class snmp::remove
#
# Removes snmp package and its relevant monitor, backup, firewall entries
#
# Usage:
# include snmp::remove
#

class snmp::remove {

    # wrapper: calls snmp::absent
    require snmp::absent

}

# vim:ft=puppet:


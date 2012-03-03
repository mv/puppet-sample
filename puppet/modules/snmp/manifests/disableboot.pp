# Class snmp::disableboot
#
# This class disables snmp startup at boot time but doesn't check if the service is running
# Useful when the service is started but another applications (such as a Cluster suite)
#
# Usage:
# include snmp::disableboot
#

class snmp::disableboot inherits snmp {
    Service["snmp"] {
        enable => "false",
    }
}

# vim:ft=puppet:


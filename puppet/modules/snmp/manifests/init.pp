#
# Class snmp
#
# Manages snmp.
# Include it to install and run snmp
# It defines package, service, main configuration file.
#
# Usage:
# include snmp
#

class snmp {

    # Load variables defined in params.pp file.
    require snmp::params

    # Default action: install
    include snmp::install

}

# vim:ft=puppet:


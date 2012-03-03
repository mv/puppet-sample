#
# Class snmp::debug
#
# This class is used only for debugging purposes
#
# Usage:
# This class is autoloaded if you set $debug=yes
#
class snmp::debug {

    # Load variables from params.pp file.
    require snmp::params
    include puppet::debug
    include puppet::params

    file { "puppet_debug_variables_snmp":
        path    => "${puppet::params::debugdir}/variables/snmp",
        mode    => "${snmp::params::config_file_mode}",
        owner   => "${snmp::params::config_file_owner}",
        group   => "${snmp::params::config_file_group}",
        ensure  => present,
        require => File["puppet_debug_variables"],
        content => template("snmp/variables_snmp.erb"),
    }

}

# vim:ft=puppet:


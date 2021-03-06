# Define snmp::conf
#
# General snmp main configuration file's inline modification define
# Use with caution, it's still at experimental stage and may break in untested circumstances
# Engine, pattern end line parameters can be tweaked for better behaviour
#
# Usage:
# snmp::conf    { "mynetworks":  value => "127.0.0.0/8 10.42.42.0/24" }
#
define snmp::config ($value) {

    require snmp::params

    config { "snmp_conf_$name":
        file      => "${snmp::params::config_file}",
        line      => "$name = $value",
        pattern   => "^$name ",
        engine    => "replaceline",
        notify    => Service["snmp"],
        require   => File["snmp.conf"],
    }

}

# vim:ft=puppet:


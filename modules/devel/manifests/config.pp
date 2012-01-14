# Define devel::conf
#
# General devel main configuration file's inline modification define
# Use with caution, it's still at experimental stage and may break in untested circumstances
# Engine, pattern end line parameters can be tweaked for better behaviour
#
# Usage:
# devel::conf    { "mynetworks":  value => "127.0.0.0/8 10.42.42.0/24" }
#
define devel::config ($value) {

    require devel::params

    config { "devel_conf_$name":
        file      => "${devel::params::config_file}",
        line      => "$name = $value",
        pattern   => "^$name ",
        engine    => "replaceline",
        notify    => Service["devel"],
        require   => File["devel.conf"],
    }

}

# vim:ft=puppet:


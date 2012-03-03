# Define sudo::conf
#
# General sudo main configuration file's inline modification define
# Use with caution, it's still at experimental stage and may break in untested circumstances
# Engine, pattern end line parameters can be tweaked for better behaviour
#
# Usage:
# sudo::conf    { "mynetworks":  value => "127.0.0.0/8 10.42.42.0/24" }
#
define sudo::config ($value) {

    require sudo::params

    config { "sudo_conf_$name":
        file      => "${sudo::params::config_file}",
        line      => "$name = $value",
        pattern   => "^$name ",
        engine    => "replaceline",
        notify    => Service["sudo"],
        require   => File["sudo.conf"],
    }

}

# vim:ft=puppet:


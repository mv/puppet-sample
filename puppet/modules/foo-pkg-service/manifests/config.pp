# Define foo-pkg-service::conf
#
# General foo-pkg-service main configuration file's inline modification define
# Use with caution, it's still at experimental stage and may break in untested circumstances
# Engine, pattern end line parameters can be tweaked for better behaviour
#
# Usage:
# foo-pkg-service::conf    { "mynetworks":  value => "127.0.0.0/8 10.42.42.0/24" }
#
define foo-pkg-service::config ($value) {

    require foo-pkg-service::params

    config { "foo-pkg-service_conf_$name":
        file      => "${foo-pkg-service::params::config_file}",
        line      => "$name = $value",
        pattern   => "^$name ",
        engine    => "replaceline",
        notify    => Service["foo-pkg-service"],
        require   => File["foo-pkg-service.conf"],
    }

}

# vim:ft=puppet:


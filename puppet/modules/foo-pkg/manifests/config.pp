# Define foo-pkg::conf
#
# General foo-pkg main configuration file's inline modification define
# Use with caution, it's still at experimental stage and may break in untested circumstances
# Engine, pattern end line parameters can be tweaked for better behaviour
#
# Usage:
# foo-pkg::conf    { "mynetworks":  value => "127.0.0.0/8 10.42.42.0/24" }
#
define foo-pkg::config ($value) {

    require foo-pkg::params

    config { "foo-pkg_conf_$name":
        file      => "${foo-pkg::params::config_file}",
        line      => "$name = $value",
        pattern   => "^$name ",
        engine    => "replaceline",
        notify    => Service["foo-pkg"],
        require   => File["foo-pkg.conf"],
    }

}

# vim:ft=puppet:


# Define openssh::conf
#
# General openssh main configuration file's inline modification define
# Use with caution, it's still at experimental stage and may break in untested circumstances
# Engine, pattern end line parameters can be tweaked for better behaviour
#
# Usage:
# openssh::conf    { "mynetworks":  value => "127.0.0.0/8 10.42.42.0/24" }
#
define openssh::config ($value) {

    require openssh::params

    config { "openssh_conf_$name":
#       file      => "${openssh::params::config_file}",
        file      => "/etc/ssh/sshd_config",
        line      => "$name = $value",
        pattern   => "^$name ",
        engine    => "replaceline",
        notify    => Service["openssh"],
        require   => File["sshd_config"],
    }

}

# vim:ft=puppet:


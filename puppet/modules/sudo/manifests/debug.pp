#
# Class sudo::debug
#
# This class is used only for debugging purposes
#
# Usage:
# This class is autoloaded if you set $debug=yes
#
class sudo::debug {

    # Load variables from params.pp file.
    require sudo::params
    include puppet::debug
    include puppet::params

    file { "puppet_debug_variables_sudo":
        path    => "${puppet::params::debugdir}/variables/sudo",
        mode    => "${sudo::params::config_file_mode}",
        owner   => "${sudo::params::config_file_owner}",
        group   => "${sudo::params::config_file_group}",
        ensure  => present,
        require => File["puppet_debug_variables"],
        content => template("sudo/variables_sudo.erb"),
    }

}

# vim:ft=puppet:


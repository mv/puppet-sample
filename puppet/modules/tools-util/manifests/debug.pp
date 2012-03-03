#
# Class tools-util::debug
#
# This class is used only for debugging purposes
#
# Usage:
# This class is autoloaded if you set $debug=yes
#
class tools-util::debug {

    # Load variables from params.pp file.
    require tools-util::params
    include puppet::debug
    include puppet::params

    file { "puppet_debug_variables_tools-util":
        path    => "${puppet::params::debugdir}/variables/tools-util",
        mode    => "${tools-util::params::config_file_mode}",
        owner   => "${tools-util::params::config_file_owner}",
        group   => "${tools-util::params::config_file_group}",
        ensure  => present,
        require => File["puppet_debug_variables"],
        content => template("tools-util/variables_tools-util.erb"),
    }

}

# vim:ft=puppet:


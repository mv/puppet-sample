#
# Class tools-dev::debug
#
# This class is used only for debugging purposes
#
# Usage:
# This class is autoloaded if you set $debug=yes
#
class tools-dev::debug {

    # Load variables from params.pp file.
    require tools-dev::params
    include puppet::debug
    include puppet::params

    file { "puppet_debug_variables_tools-dev":
        path    => "${puppet::params::debugdir}/variables/tools-dev",
        mode    => "${tools-dev::params::config_file_mode}",
        owner   => "${tools-dev::params::config_file_owner}",
        group   => "${tools-dev::params::config_file_group}",
        ensure  => present,
        require => File["puppet_debug_variables"],
        content => template("tools-dev/variables_tools-dev.erb"),
    }

}

# vim:ft=puppet:


#
# Class tools-net::debug
#
# This class is used only for debugging purposes
#
# Usage:
# This class is autoloaded if you set $debug=yes
#
class tools-net::debug {

    # Load variables from params.pp file.
    require tools-net::params
    include puppet::debug
    include puppet::params

    file { "puppet_debug_variables_tools-net":
        path    => "${puppet::params::debugdir}/variables/tools-net",
        mode    => "${tools-net::params::config_file_mode}",
        owner   => "${tools-net::params::config_file_owner}",
        group   => "${tools-net::params::config_file_group}",
        ensure  => present,
        require => File["puppet_debug_variables"],
        content => template("tools-net/variables_tools-net.erb"),
    }

}

# vim:ft=puppet:


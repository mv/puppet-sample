#
# Class tools-adm::debug
#
# This class is used only for debugging purposes
#
# Usage:
# This class is autoloaded if you set $debug=yes
#
class tools-adm::debug {

    # Load variables from params.pp file.
    require tools-adm::params
    include puppet::debug
    include puppet::params

    file { "puppet_debug_variables_tools-adm":
        path    => "${puppet::params::debugdir}/variables/tools-adm",
        mode    => "${tools-adm::params::config_file_mode}",
        owner   => "${tools-adm::params::config_file_owner}",
        group   => "${tools-adm::params::config_file_group}",
        ensure  => present,
        require => File["puppet_debug_variables"],
        content => template("tools-adm/variables_tools-adm.erb"),
    }

}

# vim:ft=puppet:


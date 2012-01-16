#
# Class devel2::debug
#
# This class is used only for debugging purposes
#
# Usage:
# This class is autoloaded if you set $debug=yes
#
class devel2::debug {

    # Load variables from params.pp file.
    require devel2::params
    include puppet::debug
    include puppet::params

    file { "puppet_debug_variables_devel2":
        path    => "${puppet::params::debugdir}/variables/devel2",
        mode    => "${devel2::params::config_file_mode}",
        owner   => "${devel2::params::config_file_owner}",
        group   => "${devel2::params::config_file_group}",
        ensure  => present,
        require => File["puppet_debug_variables"],
        content => template("devel2/variables_devel2.erb"),
    }

}

# vim:ft=puppet:


#
# Class devel::debug
#
# This class is used only for debugging purposes
#
# Usage:
# This class is autoloaded if you set $debug=yes
#
class devel::debug {

    # Load variables from params.pp file.
    require devel::params
    include puppet::debug
    include puppet::params

    file { "puppet_debug_variables_devel":
        path    => "${puppet::params::debugdir}/variables/devel",
        mode    => "${devel::params::config_file_mode}",
        owner   => "${devel::params::config_file_owner}",
        group   => "${devel::params::config_file_group}",
        ensure  => present,
        require => File["puppet_debug_variables"],
        content => template("devel/variables_devel.erb"),
    }

}

# vim:ft=puppet:


#
# Class devel3::debug
#
# This class is used only for debugging purposes
#
# Usage:
# This class is autoloaded if you set $debug=yes
#
class devel3::debug {

    # Load variables from params.pp file.
    require devel3::params
    include puppet::debug
    include puppet::params

    file { "puppet_debug_variables_devel3":
        path    => "${puppet::params::debugdir}/variables/devel3",
        mode    => "${devel3::params::config_file_mode}",
        owner   => "${devel3::params::config_file_owner}",
        group   => "${devel3::params::config_file_group}",
        ensure  => present,
        require => File["puppet_debug_variables"],
        content => template("devel3/variables_devel3.erb"),
    }

}

# vim:ft=puppet:


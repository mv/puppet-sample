#
# Class dev-libs::debug
#
# This class is used only for debugging purposes
#
# Usage:
# This class is autoloaded if you set $debug=yes
#
class dev-libs::debug {

    # Load variables from params.pp file.
    require dev-libs::params
    include puppet::debug
    include puppet::params

    file { "puppet_debug_variables_dev-libs":
        path    => "${puppet::params::debugdir}/variables/dev-libs",
        mode    => "${dev-libs::params::config_file_mode}",
        owner   => "${dev-libs::params::config_file_owner}",
        group   => "${dev-libs::params::config_file_group}",
        ensure  => present,
        require => File["puppet_debug_variables"],
        content => template("dev-libs/variables_dev-libs.erb"),
    }

}

# vim:ft=puppet:


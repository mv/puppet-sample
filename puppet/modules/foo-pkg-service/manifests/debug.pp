#
# Class foo-pkg-service::debug
#
# This class is used only for debugging purposes
#
# Usage:
# This class is autoloaded if you set $debug=yes
#
class foo-pkg-service::debug {

    # Load variables from params.pp file.
    require foo-pkg-service::params
    include puppet::debug
    include puppet::params

    file { "puppet_debug_variables_foo-pkg-service":
        path    => "${puppet::params::debugdir}/variables/foo-pkg-service",
        mode    => "${foo-pkg-service::params::config_file_mode}",
        owner   => "${foo-pkg-service::params::config_file_owner}",
        group   => "${foo-pkg-service::params::config_file_group}",
        ensure  => present,
        require => File["puppet_debug_variables"],
        content => template("foo-pkg-service/variables_foo-pkg-service.erb"),
    }

}

# vim:ft=puppet:


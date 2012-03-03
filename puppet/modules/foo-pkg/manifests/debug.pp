#
# Class foo-pkg::debug
#
# This class is used only for debugging purposes
#
# Usage:
# This class is autoloaded if you set $debug=yes
#
class foo-pkg::debug {

    # Load variables from params.pp file.
    require foo-pkg::params
    include puppet::debug
    include puppet::params

    file { "puppet_debug_variables_foo-pkg":
        path    => "${puppet::params::debugdir}/variables/foo-pkg",
        mode    => "${foo-pkg::params::config_file_mode}",
        owner   => "${foo-pkg::params::config_file_owner}",
        group   => "${foo-pkg::params::config_file_group}",
        ensure  => present,
        require => File["puppet_debug_variables"],
        content => template("foo-pkg/variables_foo-pkg.erb"),
    }

}

# vim:ft=puppet:


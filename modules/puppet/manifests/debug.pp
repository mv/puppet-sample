#
# Class puppet::debug
#
# This class is used only for debugging purposes
#
# Usage:
# This class is autoloaded if you set $debug=yes
#
class puppet::debug {

    # Load variables from params.pp file.
    require puppet::params
    include puppet::debug
    include puppet::params

    file { "puppet_debug_variables_puppet":
        path    => "${puppet::params::debugdir}/variables/puppet",
        mode    => "${puppet::params::config_file_mode}",
        owner   => "${puppet::params::config_file_owner}",
        group   => "${puppet::params::config_file_group}",
        ensure  => present,
        require => File["puppet_debug_variables"],
        content => template("puppet/variables_puppet.erb"),
    }

}

# vim:ft=puppet:


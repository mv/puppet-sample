#
# Class openssh::debug
#
# This class is used only for debugging purposes
#
# Usage:
# This class is autoloaded if you set $debug=yes
#
class openssh::debug {

    # Load variables from params.pp file.
    require openssh::params
    include puppet::debug
    include puppet::params

    file { "puppet_debug_variables_openssh":
        path    => "${puppet::params::debugdir}/variables/openssh",
        mode    => "${openssh::params::config_file_mode}",
        owner   => "${openssh::params::config_file_owner}",
        group   => "${openssh::params::config_file_group}",
        ensure  => present,
        require => File["puppet_debug_variables"],
        content => template("openssh/variables_openssh.erb"),
    }

}

# vim:ft=puppet:


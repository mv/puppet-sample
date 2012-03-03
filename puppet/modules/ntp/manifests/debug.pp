#
# Class ntp::debug
#
# This class is used only for debugging purposes
#
# Usage:
# This class is autoloaded if you set $debug=yes
#
class ntp::debug {

    # Load variables from params.pp file.
    require ntp::params
    include puppet::debug
    include puppet::params

    file { "puppet_debug_variables_ntp":
        path    => "${puppet::params::debugdir}/variables/ntp",
        mode    => "${ntp::params::config_file_mode}",
        owner   => "${ntp::params::config_file_owner}",
        group   => "${ntp::params::config_file_group}",
        ensure  => present,
        require => File["puppet_debug_variables"],
        content => template("ntp/variables_ntp.erb"),
    }

}

# vim:ft=puppet:


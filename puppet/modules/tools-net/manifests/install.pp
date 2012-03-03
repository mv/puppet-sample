# Class tools-net::install
#
# Usage:
# include tools-net::install
#

class tools-net::install {

    # Load variables defined in params.pp file.
    require tools-net::params

    # Register
    motd::register{ "tools-net" : }

    package { $tools-net::params::rpm_list :
        ensure => present,
    }

}

# vim:ft=puppet:


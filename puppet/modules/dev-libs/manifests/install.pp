# Class dev-libs::install
#
# It defines package, service, main configuration file.
#
# Usage:
# include dev-libs
#

class dev-libs::install {

    # Load variables defined in params.pp file.
    require dev-libs::params

    # Register
    motd::register{ "dev-libs" : }

    Package { ensure => present }

    package { $dev-libs::params::rpm_list : }

}

# vim:ft=puppet:


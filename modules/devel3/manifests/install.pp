# Class devel3::install
#
# It defines package, service, main configuration file.
#
# Usage:
# include devel3
#

class devel3::install {

    # Load variables defined in params.pp file.
    require devel3::params

    # Register
    motd::register{ "devel3" : }

    Package { ensure => present }

    package { $devel3::params::rpm_list : }

}

# vim:ft=puppet:


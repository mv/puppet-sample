# Class tools-net::absent
#
# Usage:
# include tools-net::absent
#

class tools-net::absent {

    # Load variables defined in params.pp file.
    require tools-net::params

    package { $tools-net::params::rpm_list : 
        ensure => absent,
    }


}

# vim:ft=puppet:


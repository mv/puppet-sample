# Class tools-dev::absent
#
# Usage:
# include tools-dev::absent
#

class tools-dev::absent {

    # Load variables defined in params.pp file.
    require tools-dev::params

    package { $tools-dev::params::rpm_list :
		ensure => absent 
	}


}

# vim:ft=puppet:


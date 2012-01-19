# Class tools-util::absent
#
# Usage:
# include tools-util::absent
#

class tools-util::absent {

    # Load variables defined in params.pp file.
    require tools-util::params

    package { $tools-util::params::rpm_list : 
    	ensure => absent 
	}

}

# vim:ft=puppet:


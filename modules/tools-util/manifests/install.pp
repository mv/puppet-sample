# Class tools-util::install
#
# Usage:
# include tools-util
#

class tools-util::install {

    # Load variables defined in params.pp file.
    require tools-util::params

    # Register
    motd::register{ "tools-util" : }

    package { $tools-util::params::rpm_list : 
    	ensure => present 
	}

}

# vim:ft=puppet:


# Class tools-dev::install
#
# Usage:
# include tools-dev
#

class tools-dev::install {

    # Load variables defined in params.pp file.
    require tools-dev::params

    # Register
    motd::register{ "tools-dev" : }

    package { $tools-dev::params::rpm_list :
		ensure => present 
	}

}

# vim:ft=puppet:


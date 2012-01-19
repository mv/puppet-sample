# Class tools-adm::install
#
# Usage:
# include tools-adm
#

class tools-adm::install {

    # Load variables defined in params.pp file.
    require tools-adm::params

    # Register
    motd::register{ "tools-adm" : }

    package { $tools-adm::params::rpm_list : 
		ensure => present 
	}

}

# vim:ft=puppet:


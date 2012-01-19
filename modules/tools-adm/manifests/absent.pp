# Class tools-adm::absent
#
# Usage:
# include tools-adm::absent
#

class tools-adm::absent {

    # Load variables defined in params.pp file.
    require tools-adm::params

    package { ${tools-adm::params::rpm_list} :
		ensure => absent 
	}

}

# vim:ft=puppet:


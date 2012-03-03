# Class htop::install
#
# It defines package, service, main configuration file.
#
# Usage:
# include htop
#

class htop::install {

    # Register
    motd::register{ "htop": content => 'htop' }

    # Package/Service/File tripplet
    package { "htop":
        source => "https://github.com/downloads/mv/rpm/htop-0.9.abril-1.x86_64.rpm",
        ensure => present,
    }

}

# vim:ft=puppet:


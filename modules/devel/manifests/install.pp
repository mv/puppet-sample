# Class devel::install
#
# It defines package, service, main configuration file.
#
# Usage:
# include devel
#

class devel::install {

    # Load variables defined in params.pp file.
    require devel::params

    package { $devel::params::pkg_name :
        ensure => present,
    }

    # Include debug class (debug.pp) if debugging is enabled ($debug=yes)
    if ( $debug == "yes" ) or ( $debug == true ) { include devel::debug }

}

# vim:ft=puppet:


# Class ntp::install
#
# It defines package, service, main configuration file.
#
# Usage:
# include ntp
#

class ntp::install {

    # Load variables defined in params.pp file.
    require ntp::params

    # Package/Service/File tripplet
    package { "ntp":
        name   => "${ntp::params::pkg_name}",
        ensure => present,
    }

    service { "ntp":
        name       => "${ntp::params::service_name}",
        ensure     => running,
        enable     => true,
        hasrestart => true,
        hasstatus  => "${ntp::params::has_status}",
        pattern    => "${ntp::params::process_name}",
        require    => Package["ntp"],
        subscribe  => File["ntp.conf"],
    }

    file { "ntp.conf":
        path    => "${ntp::params::config_file}",
        mode    => "${ntp::params::config_file_mode}",
        owner   => "${ntp::params::config_file_owner}",
        group   => "${ntp::params::config_file_group}",
        ensure  => present,
        require => Package["ntp"],
        notify  => Service["ntp"],
        source  => ["puppet:///ntp/ntp.conf.${environment}",
                    "puppet:///ntp/ntp.conf"],
        audit   => "all",
    }

    # Include OS specific subclasses, if necessary
  # case $operatingsystem {
  #     default: { }
  # }

    # Include project specific class if $my_project is set
    if $my_project { include "ntp::${my_project}" }

    # Include extended classes, if relevant variables are defined
    if $backup   == "yes" { include ntp::backup   }
    if $monitor  == "yes" { include ntp::monitor  }
    if $firewall == "yes" { include ntp::firewall }
    if $puppi    == "yes" { include ntp::puppi    }

    # Include debug class (debug.pp) if debugging is enabled ($debug=yes)
    if ( $debug == "yes" ) or ( $debug == true ) { include ntp::debug }

}

# vim:ft=puppet:


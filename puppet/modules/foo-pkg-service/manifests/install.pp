# Class foo-pkg-service::install
#
# It defines package, service, main configuration file.
#
# Usage:
# include foo-pkg-service
#

class foo-pkg-service::install {

    # Load variables defined in params.pp file.
    require foo-pkg-service::params

    # Register
    motd::register{ "foo-pkg-service" : }

    # Package/Service/File tripplet
    package { "foo-pkg-service":
        name   => "${foo-pkg-service::params::pkg_name}",
        ensure => present,
    }

    service { "foo-pkg-service":
        name       => "${foo-pkg-service::params::service_name}",
        ensure     => running,
        enable     => true,
        hasrestart => true,
        hasstatus  => "${foo-pkg-service::params::has_status}",
        pattern    => "${foo-pkg-service::params::process_name}",
        require    => Package["foo-pkg-service"],
        subscribe  => File["foo-pkg-service.conf"],
    }

    file { "foo-pkg-service.conf":
        path    => "${foo-pkg-service::params::config_file}",
        mode    => "${foo-pkg-service::params::config_file_mode}",
        owner   => "${foo-pkg-service::params::config_file_owner}",
        group   => "${foo-pkg-service::params::config_file_group}",
        ensure  => present,
        audit   => "all",
        require => Package["foo-pkg-service"],
        notify  => Service["foo-pkg-service"],
        source  => ["puppet:///foo-pkg-service/foo-pkg-service.conf.${environment}",
                    "puppet:///foo-pkg-service/foo-pkg-service.conf"],
    }

    # Include OS specific subclasses, if necessary
  # case $operatingsystem {
  #     default: { }
  # }

    # Include project specific class if $my_project is set
    if $my_project { include "foo-pkg-service::${my_project}" }

    # Include extended classes, if relevant variables are defined
    if $backup   == "yes" { include foo-pkg-service::backup   }
    if $monitor  == "yes" { include foo-pkg-service::monitor  }
    if $firewall == "yes" { include foo-pkg-service::firewall }
    if $puppi    == "yes" { include foo-pkg-service::puppi    }

    # Include debug class (debug.pp) if debugging is enabled ($debug=yes)
    if ( $debug == "yes" ) or ( $debug == true ) { include foo-pkg-service::debug }

}

# vim:ft=puppet:


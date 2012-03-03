# Class foo::install
#
# It defines package, service, main configuration file.
#
# Usage:
# include foo
#

class foo::install {

    # Load variables defined in params.pp file.
    require foo::params

    # Register
    motd::register{ "foo" : }

    # Package/Service/File tripplet
    package { "foo":
        name   => "${foo::params::pkg_name}",
        ensure => present,
    }

    service { "foo":
        name       => "${foo::params::service_name}",
        ensure     => running,
        enable     => true,
        hasrestart => true,
        hasstatus  => "${foo::params::has_status}",
        pattern    => "${foo::params::process_name}",
        require    => Package["foo"],
        subscribe  => File["foo.conf"],
    }

    file { "foo.conf":
        path    => "${foo::params::config_file}",
        mode    => "${foo::params::config_file_mode}",
        owner   => "${foo::params::config_file_owner}",
        group   => "${foo::params::config_file_group}",
        ensure  => present,
        audit   => "all",
        require => Package["foo"],
        notify  => Service["foo"],
        source  => ["puppet:///foo/foo.conf.${environment}",
                    "puppet:///foo/foo.conf"],
        # content => template("foo/foo.conf.erb"),
    }

    # Include OS specific subclasses, if necessary
  # case $operatingsystem {
  #     default: { }
  # }

    # Include project specific class if $my_project is set
    if $my_project { include "foo::${my_project}" }

    # Include extended classes, if relevant variables are defined
    if $backup   == "yes" { include foo::backup   }
    if $monitor  == "yes" { include foo::monitor  }
    if $firewall == "yes" { include foo::firewall }
    if $puppi    == "yes" { include foo::puppi    }

    # Include debug class (debug.pp) if debugging is enabled ($debug=yes)
    if ( $debug == "yes" ) or ( $debug == true ) { include foo::debug }

}

# vim:ft=puppet:


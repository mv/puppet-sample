# Class snmp::install
#
# It defines package, service, main configuration file.
#
# Usage:
# include snmp
#

class snmp::install {

    # Load variables defined in params.pp file.
    require snmp::params

    # Register
    motd::register{ "snmp" : }

    # Package/Service/File tripplet
    package { "snmp":
        name   => "${snmp::params::pkg_name}",
        ensure => present,
    }

    service { "snmp":
        name       => "${snmp::params::service_name}",
        ensure     => running,
        enable     => true,
        hasrestart => true,
        hasstatus  => "${snmp::params::has_status}",
        pattern    => "${snmp::params::process_name}",
        require    => Package["snmp"],
        subscribe  => File["snmp.conf"],
    }

    file { "snmp.conf":
        path    => "${snmp::params::config_file}",
        mode    => "${snmp::params::config_file_mode}",
        owner   => "${snmp::params::config_file_owner}",
        group   => "${snmp::params::config_file_group}",
        ensure  => present,
        audit   => "all",
        require => Package["snmp"],
        notify  => Service["snmp"],
        source  => ["puppet:///snmp/snmp.conf.${environment}",
                    "puppet:///snmp/snmp.conf"],
    }

    # Include OS specific subclasses, if necessary
  # case $operatingsystem {
  #     default: { }
  # }

    # Include project specific class if $my_project is set
    if $my_project { include "snmp::${my_project}" }

    # Include extended classes, if relevant variables are defined
    if $backup   == "yes" { include snmp::backup   }
    if $monitor  == "yes" { include snmp::monitor  }
    if $firewall == "yes" { include snmp::firewall }
    if $puppi    == "yes" { include snmp::puppi    }

    # Include debug class (debug.pp) if debugging is enabled ($debug=yes)
    if ( $debug == "yes" ) or ( $debug == true ) { include snmp::debug }

}

# vim:ft=puppet:


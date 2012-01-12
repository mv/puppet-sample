# Class openssh::install
#
# It defines package, service, main configuration file.
#
# Usage:
# include openssh
#

class openssh::install {

    # Load variables defined in params.pp file.
    require openssh::params

    # Package/Service/File tripplet
    package { "openssh":
        name   => "${openssh::params::pkg_name}",
        ensure => present,
    }

    service { "openssh":
        name       => "${openssh::params::service_name}",
        ensure     => running,
        enable     => true,
        hasrestart => true,
        hasstatus  => "${openssh::params::has_status}",
        pattern    => "${openssh::params::process_name}",
        require    => Package["openssh"],
        subscribe  => File["sshd_config"],
    }

    file { "sshd_config":
        path    => "${openssh::params::config_file}",
        owner   => "${openssh::params::config_file_owner}",
        group   => "${openssh::params::config_file_group}",
        ensure  => present,
        audit   => "all",
        require => Package["openssh"],
        notify  => Service["openssh"],
        content => template("openssh/sshd_config.erb"),
    }

    file { "ssh_config":
        path    => "${openssh::params::config_dir}/ssh_config",
        owner   => "${openssh::params::config_file_owner}",
        group   => "${openssh::params::config_file_group}",
        ensure  => present,
        audit   => "all",
        source  => ["puppet:///openssh/ssh_config"],
    }

    # Include OS specific subclasses, if necessary
  # case $operatingsystem {
  #     default: { }
  # }

    # Include project specific class if $my_project is set
    if $my_project { include "openssh::${my_project}" }

    # Include extended classes, if relevant variables are defined
    if $backup   == "yes" { include openssh::backup   }
    if $monitor  == "yes" { include openssh::monitor  }
    if $firewall == "yes" { include openssh::firewall }
    if $puppi    == "yes" { include openssh::puppi    }

    # Include debug class (debug.pp) if debugging is enabled ($debug=yes)
    if ( $debug == "yes" ) or ( $debug == true ) { include openssh::debug }

}

# vim:ft=puppet:


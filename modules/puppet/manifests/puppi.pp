# Class puppet::puppi
#
# This class manages the puppi extensions for the puppet module
# It's automatically included and used if $puppi=yes
#
class puppet::puppi {

    puppi::info::module { "puppet":
        pkg_name     => "${puppet::params::pkg_name}",
        service_name => "${puppet::params::service_name}",
        process_name => "${puppet::params::process_name}",
        config_file  => "${puppet::params::config_file}",
        config_dir   => "${puppet::params::config_dir}",
        pid_file     => "${puppet::params::pid_file}",
        data_dir     => "${puppet::params::data_dir}",
        log_dir      => "${puppet::params::log_dir}",
        protocol     => "${puppet::params::protocol}",
        port         => "${puppet::params::port}",
        description  => "What Puppet knows about puppet" ,
        # run         => "puppet -V###",
    }

    puppi::log { "puppet":
        description => "Logs of puppet" ,
        log         => "${puppet::params::log_dir}",
    }

}

# vim:ft=puppet:


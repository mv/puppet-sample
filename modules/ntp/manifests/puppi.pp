# Class: ntp::puppi
#
# This class manages the puppi extensions for the ntp module
# It's automatically included and used if $puppi=yes
#
class ntp::puppi {

    puppi::info::module { "ntp":
        pkg_name     => "${ntp::params::pkg_name}",
        service_name => "${ntp::params::service_name}",
        process_name => "${ntp::params::process_name}",
        config_file  => "${ntp::params::config_file}",
        config_dir   => "${ntp::params::config_dir}",
        pid_file     => "${ntp::params::pid_file}",
        data_dir     => "${ntp::params::data_dir}",
        log_dir      => "${ntp::params::log_dir}",
        protocol     => "${ntp::params::protocol}",
        port         => "${ntp::params::port}",
        description  => "What Puppet knows about ntp" ,
        # run         => "ntp -V###",
    }

    puppi::log { "ntp":
        description => "Logs of ntp" ,
        log         => "${ntp::params::log_dir}",
    }

}

# vim:ft=puppet:


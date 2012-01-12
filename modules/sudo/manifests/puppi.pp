# Class sudo::puppi
#
# This class manages the puppi extensions for the sudo module
# It's automatically included and used if $puppi=yes
#
class sudo::puppi {

    puppi::info::module { "sudo":
        pkg_name     => "${sudo::params::pkg_name}",
        service_name => "${sudo::params::service_name}",
        process_name => "${sudo::params::process_name}",
        config_file  => "${sudo::params::config_file}",
        config_dir   => "${sudo::params::config_dir}",
        pid_file     => "${sudo::params::pid_file}",
        data_dir     => "${sudo::params::data_dir}",
        log_dir      => "${sudo::params::log_dir}",
        protocol     => "${sudo::params::protocol}",
        port         => "${sudo::params::port}",
        description  => "What Puppet knows about sudo" ,
        # run         => "sudo -V###",
    }

    puppi::log { "sudo":
        description => "Logs of sudo" ,
        log         => "${sudo::params::log_dir}",
    }

}

# vim:ft=puppet:


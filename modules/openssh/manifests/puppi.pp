# Class openssh::puppi
#
# This class manages the puppi extensions for the openssh module
# It's automatically included and used if $puppi=yes
#
class openssh::puppi {

    puppi::info::module { "openssh":
        pkg_name     => "${openssh::params::pkg_name}",
        service_name => "${openssh::params::service_name}",
        process_name => "${openssh::params::process_name}",
        config_file  => "${openssh::params::config_file}",
        config_dir   => "${openssh::params::config_dir}",
        pid_file     => "${openssh::params::pid_file}",
        data_dir     => "${openssh::params::data_dir}",
        log_dir      => "${openssh::params::log_dir}",
        protocol     => "${openssh::params::protocol}",
        port         => "${openssh::params::port}",
        description  => "What Puppet knows about openssh" ,
        # run         => "openssh -V###",
    }

    puppi::log { "openssh":
        description => "Logs of openssh" ,
        log         => "${openssh::params::log_dir}",
    }

}

# vim:ft=puppet:


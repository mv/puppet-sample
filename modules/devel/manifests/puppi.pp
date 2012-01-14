# Class devel::puppi
#
# This class manages the puppi extensions for the devel module
# It's automatically included and used if $puppi=yes
#
class devel::puppi {

    puppi::info::module { "devel":
        pkg_name     => "${devel::params::pkg_name}",
        service_name => "${devel::params::service_name}",
        process_name => "${devel::params::process_name}",
        config_file  => "${devel::params::config_file}",
        config_dir   => "${devel::params::config_dir}",
        pid_file     => "${devel::params::pid_file}",
        data_dir     => "${devel::params::data_dir}",
        log_dir      => "${devel::params::log_dir}",
        protocol     => "${devel::params::protocol}",
        port         => "${devel::params::port}",
        description  => "What Puppet knows about devel" ,
        # run         => "devel -V###",
    }

    puppi::log { "devel":
        description => "Logs of devel" ,
        log         => "${devel::params::log_dir}",
    }

}

# vim:ft=puppet:


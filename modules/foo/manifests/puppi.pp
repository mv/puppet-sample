# Class foo::puppi
#
# This class manages the puppi extensions for the foo module
# It's automatically included and used if $puppi=yes
#
class foo::puppi {

    puppi::info::module { "foo":
        pkg_name     => "${foo::params::pkg_name}",
        service_name => "${foo::params::service_name}",
        process_name => "${foo::params::process_name}",
        config_file  => "${foo::params::config_file}",
        config_dir   => "${foo::params::config_dir}",
        pid_file     => "${foo::params::pid_file}",
        data_dir     => "${foo::params::data_dir}",
        log_dir      => "${foo::params::log_dir}",
        protocol     => "${foo::params::protocol}",
        port         => "${foo::params::port}",
        description  => "What Puppet knows about foo" ,
        # run         => "foo -V###",
    }

    puppi::log { "foo":
        description => "Logs of foo" ,
        log         => "${foo::params::log_dir}",
    }

}

# vim:ft=puppet:


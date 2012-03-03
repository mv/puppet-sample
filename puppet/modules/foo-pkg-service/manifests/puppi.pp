# Class foo-pkg-service::puppi
#
# This class manages the puppi extensions for the foo-pkg-service module
# It's automatically included and used if $puppi=yes
#
class foo-pkg-service::puppi {

    puppi::info::module { "foo-pkg-service":
        pkg_name     => "${foo-pkg-service::params::pkg_name}",
        service_name => "${foo-pkg-service::params::service_name}",
        process_name => "${foo-pkg-service::params::process_name}",
        config_file  => "${foo-pkg-service::params::config_file}",
        config_dir   => "${foo-pkg-service::params::config_dir}",
        pid_file     => "${foo-pkg-service::params::pid_file}",
        data_dir     => "${foo-pkg-service::params::data_dir}",
        log_dir      => "${foo-pkg-service::params::log_dir}",
        protocol     => "${foo-pkg-service::params::protocol}",
        port         => "${foo-pkg-service::params::port}",
        description  => "What Puppet knows about foo-pkg-service" ,
        # run         => "foo-pkg-service -V###",
    }

    puppi::log { "foo-pkg-service":
        description => "Logs of foo-pkg-service" ,
        log         => "${foo-pkg-service::params::log_dir}",
    }

}

# vim:ft=puppet:


# Class puppet::install
#
# It defines package, service, main configuration file.
#
# Usage:
# include puppet
#

class puppet::install {

    # Load variables defined in params.pp file.
    require puppet::params

    # Register
    motd::register{ "puppet" : }

    group { "puppet":
        ensure     => present,
        gid        => "498",
    }

    user { "puppet":
        ensure     => present,
        uid        => "498",
        gid        => "498",
        shell      => "/sbin/nologin",
        home       => "/dev/null",
        comment    => "Puppet",
        managehome => false,
        allowdupe  => false
    }

    file { "/etc/puppet":   # Dir
        ensure  => directory,
        path    => "/etc/puppet",
        mode    => "0775",
        owner   => "root",
        group   => "root",
        recurse => false,
    }

    file { "puppet.conf":
        ensure  => present,
        mode    => "0664",
        owner   => "root",
        group   => "root",
        path    => "/etc/puppet.conf",
        audit   => "all",
    }

}

# vim:ft=puppet:


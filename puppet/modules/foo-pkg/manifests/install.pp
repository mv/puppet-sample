# Class foo-pkg::install
#
# It defines package, service, main configuration file.
#
# Usage:
# include foo-pkg
#

class foo-pkg::install {

    # Load variables defined in params.pp file.
    require foo-pkg::params

    # Register
    motd::register{ "foo-pkgers": content => 'foo-pkg' }

    # Package/Service/File tripplet
    package { "foo-pkg":
        name   => "${foo-pkg::params::pkg_name}",
        ensure => present,
    }

    File {
        owner   => "root",
        group   => "root",
        ensure  => present,
        audit   => "all",
        require => Package["foo-pkg"],
    }

    file { "foo-pkgers":
        path    => "/etc/foo-pkgers",
        mode    => "0440",
        backup  => '.bkp',
        source  => ["puppet:///foo-pkg/foo-pkgers.%{location}",
                    "puppet:///foo-pkg/foo-pkgers.vagrant",
                    "puppet:///foo-pkg/foo-pkgers"],
    }

    file { "foo-pkg":
        path    => "/usr/bin/foo-pkg",
        mode    => "4111",
    }

    file { "foo-pkgedit":
        path    => "/usr/bin/foo-pkgedit",
        mode    => "4111",
    }

    file { "vifoo-pkg":
        path    => "/usr/sbin/vifoo-pkg",
        mode    => "0755",
    }

# /bin/ls -lh {/etc,/usr/bin}/*foo-pkg*
# rpm -ql foo-pkg | grep -v share | xargs ls -lh
#
#     -r--r----- 1 root root 3.4K Dec 14 15:53 /etc/foo-pkgers
#     ---s--x--x 2 root root 180K Mar  5  2011 /usr/bin/foo-pkg
#     ---s--x--x 2 root root 180K Mar  5  2011 /usr/bin/foo-pkgedit
#     -rwxr-xr-x 1 root root 102K Mar  5  2011 /usr/sbin/vifoo-pkg
#     -rwxr-xr-x 1 root root 5.4K Mar  5  2011 /usr/libexec/sesh
#     -rwxr-xr-x 1 root root 6.3K Mar  5  2011 /usr/libexec/foo-pkg_noexec.so
#     -rw-r--r-- 1 root root  179 Mar  5  2011 /etc/pam.d/foo-pkg
#     -rw-r--r-- 1 root root  164 Mar  5  2011 /etc/pam.d/foo-pkg-i

}

# vim:ft=puppet:


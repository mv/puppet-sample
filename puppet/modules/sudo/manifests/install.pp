# Class sudo::install
#
# It defines package, service, main configuration file.
#
# Usage:
# include sudo
#

class sudo::install {

    # Load variables defined in params.pp file.
    require sudo::params

    # Register
    motd::register{ "sudoers": content => 'sudo' }

    # Package/Service/File tripplet
    package { "sudo":
        name   => "${sudo::params::pkg_name}",
        ensure => present,
    }

    File {
        owner   => "root",
        group   => "root",
        ensure  => present,
        audit   => "all",
        require => Package["sudo"],
    }

    file { "sudoers":
        path    => "/etc/sudoers",
        mode    => "0440",
        backup  => '.bkp',
        source  => ["puppet:///sudo/sudoers.%{location}",
                    "puppet:///sudo/sudoers.vagrant",
                    "puppet:///sudo/sudoers"],
    }

    file { "sudo":
        path    => "/usr/bin/sudo",
        mode    => "4111",
    }

    file { "sudoedit":
        path    => "/usr/bin/sudoedit",
        mode    => "4111",
    }

    file { "visudo":
        path    => "/usr/sbin/visudo",
        mode    => "0755",
    }

# /bin/ls -lh {/etc,/usr/bin}/*sudo*
# rpm -ql sudo | grep -v share | xargs ls -lh
#
#     -r--r----- 1 root root 3.4K Dec 14 15:53 /etc/sudoers
#     ---s--x--x 2 root root 180K Mar  5  2011 /usr/bin/sudo
#     ---s--x--x 2 root root 180K Mar  5  2011 /usr/bin/sudoedit
#     -rwxr-xr-x 1 root root 102K Mar  5  2011 /usr/sbin/visudo
#     -rwxr-xr-x 1 root root 5.4K Mar  5  2011 /usr/libexec/sesh
#     -rwxr-xr-x 1 root root 6.3K Mar  5  2011 /usr/libexec/sudo_noexec.so
#     -rw-r--r-- 1 root root  179 Mar  5  2011 /etc/pam.d/sudo
#     -rw-r--r-- 1 root root  164 Mar  5  2011 /etc/pam.d/sudo-i

}

# vim:ft=puppet:


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
        mode    => "440",
    }

    file { "sudo":
        path    => "/usr/bin/sudo",
        mode    => "01111",
    }

    file { "sudoedit":
        path    => "/usr/bin/sudoedit",
        mode    => "01111",
    }

    file { "visudo":
        path    => "/usr/sbin/visudo",
        mode    => "755",
    }

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


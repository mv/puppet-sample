#
# Class motd
#
# Usage:
#     include motd
#
# Manages /etc/motd.
# It uses module 'concat' to dynamically show current puppet modules
#

class motd {

    include concat::setup

    $motd = "/etc/motd"

    concat{ $motd :
        owner => 'root',
        group => 'root',
        mode  => 644
    }

    concat::fragment{ "motd_header" :
        target  => $motd,
        source  => 'puppet:///modules/motd/motd.txt',
        order   => 01,
    }

    # local users on the machine can append to motd by just creating
    # /etc/motd.local
    concat::fragment{ "motd_local" :
        target  => $motd,
        ensure  => "/etc/motd.local",
        order   => 15
    }

    concat::fragment{ "motd_footer" :
        target  => $motd,
        content => "\n\n",
        order   => 20
    }

}


# vim:ft=puppet:


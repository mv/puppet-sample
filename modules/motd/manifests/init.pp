
class motd {

    file { "/etc/motd":
        owner  => 'root',
        group  => 'root',
        mode   => '644',
        source => 'puppet:///modules/motd/motd.txt'
    }

}


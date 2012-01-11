
class motd {

    file { '/etc/motd':
        owner  => 'root',
        group  => 'root',
        mode   => '664',
        source => 'puppet:///modules/motd/motd.txt',
        backup => '.bkp',
        audit  => 'all',
    }




}


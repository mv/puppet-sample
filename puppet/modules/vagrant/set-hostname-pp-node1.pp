#
# standalone .pp
# to be used by vagrant provisioning
#

exec { 'set-hostname': command => '/bin/hostname node1' }

file { '/etc/sysconfig/network':
    ensure  => present,
    content => '
HOSTNAME=node1
NETWORKING=yes
NETWORKING_IPV6=no
',
}

file { '/etc/hosts':
    ensure  => present,
    content => '
127.0.0.1   localhost.localdomain   localhost
::1         localhost6.localdomain6 localhost6

### My master
192.168.10.50 master.local master puppet

### myself:
192.168.10.51 node1.local  node1

',
}


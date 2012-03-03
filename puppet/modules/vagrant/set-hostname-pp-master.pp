#
# standalone .pp
# to be used by vagrant provisioning
#

exec { 'set-hostname': command => '/bin/hostname master' }

file { '/etc/sysconfig/network':
    ensure  => present,
    content => '
HOSTNAME=master
NETWORKING=yes
NETWORKING_IPV6=no
',
}

file { '/etc/hosts':
    ensure  => present,
    content => '
127.0.0.1   localhost.localdomain   localhost
::1         localhost6.localdomain6 localhost6

### myself:
192.168.10.50 master.local master puppet

### All nodes
192.168.10.51 node1.local  node1
192.168.10.52 node2.local  node2

',
}


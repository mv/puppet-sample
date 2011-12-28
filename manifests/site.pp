# import 'nodes'

# $puppetserver = 'pp-master.local'

node default {
    include sudo
}

node /node/ {
    include motd
    include sudo
}


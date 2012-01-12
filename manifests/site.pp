# import 'nodes'   # nodes.pp
# import 'nodes/*' # nodes/*.pp

# $puppetserver = 'pp-master.local'

node default {
    include sudo
	include ntp
	include ssh
}

node /node/ {
    include motd
    include sudo
    include ntp
	include openssh
#   include ntp::remove
}

node /.*/ {
    include motd
	include hbase::remove
}


# $extlookup_datadir = "/etc/puppet/config"
# $extlookup_precedence = [ "location_%{loc}.yml",
# 						  "app_%{app}.yml",
# 						  "env_{env}.yml",
# 						  "common.yml" ]

# $extlookup_precedence = ["%{fqdn}",
#                          "location_%{location}",
#                          "app_%{app}",
#                          "env_%{env}",
#                          "domain_%{domain}",
#                          "default"
#                          ]

# /etc/puppet/config/localtion_vagrant.yml
# /etc/puppet/config/localtion_dc1.yml
# /etc/puppet/config/localtion_dc2.yml
# /etc/puppet/config/localtion_aws.yml
# /etc/puppet/config/localtion_joyent.yml
# /etc/puppet/config/common.yml



# vim:ft=puppet:


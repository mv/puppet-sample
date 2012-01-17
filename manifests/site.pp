# import 'nodes'   # nodes.pp
# import 'nodes/*' # nodes/*.pp

# $puppetserver = 'pp-master.local'

node default {
    include motd
    include ntp
    include openssh
    include sudo
    include puppet
}

node /node/ {
    include motd
    include ntp
    include openssh
    include sudo
    include puppet
    include devel3
#   include devel3::remove
#   include devel2
#   include devel2::remove
#   include devel::install
#   include devel::remove
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

/* node default {                     */

/*     # read /etc/node/this-node.yml */
/*     include nodes::setup           */

/*     # implement 'has_role' rules   */
/*     include truth::enforcer        */

/* }                                  */



# vim:ft=puppet:


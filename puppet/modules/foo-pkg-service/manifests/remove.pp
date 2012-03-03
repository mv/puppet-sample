# Class foo-pkg-service::remove
#
# Removes foo-pkg-service package and its relevant monitor, backup, firewall entries
#
# Usage:
# include foo-pkg-service::remove
#

class foo-pkg-service::remove {

    # wrapper: calls foo-pkg-service::absent
    require foo-pkg-service::absent

}

# vim:ft=puppet:


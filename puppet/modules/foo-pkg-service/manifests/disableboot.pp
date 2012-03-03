# Class foo-pkg-service::disableboot
#
# This class disables foo-pkg-service startup at boot time but doesn't check if the service is running
# Useful when the service is started but another applications (such as a Cluster suite)
#
# Usage:
# include foo-pkg-service::disableboot
#

class foo-pkg-service::disableboot inherits foo-pkg-service {
    Service["foo-pkg-service"] {
        enable => "false",
    }
}

# vim:ft=puppet:


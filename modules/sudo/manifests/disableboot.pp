# Class sudo::disableboot
#
# This class disables sudo startup at boot time but doesn't check if the service is running
# Useful when the service is started but another applications (such as a Cluster suite)
#
# Usage:
# include sudo::disableboot
#

class sudo::disableboot inherits sudo {
    Service["sudo"] {
        enable => "false",
    }
}

# vim:ft=puppet:


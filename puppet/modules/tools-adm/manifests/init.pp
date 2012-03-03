#
# Class tools-adm
#
# Manages tools-adm.
# Include it to install and run tools-adm
# It defines package, service, main configuration file.
#
# Usage:
# include tools-adm
#

class tools-adm {

    # Load variables defined in params.pp file.
    require tools-adm::params

    # Default action: install
    include tools-adm::install

}

# vim:ft=puppet:


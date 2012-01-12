#
# Class: foo
#
# Manages foo.
# Include it to install and run foo
# It defines package, service, main configuration file.
#
# Usage:
# include foo
#

class foo {

    # Load variables defined in params.pp file.
    require foo::params

    # Default action: install
    require foo::install

}

# vim:ft=puppet:


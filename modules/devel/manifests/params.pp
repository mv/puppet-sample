# Class devel::params
#
# Sets internal variables and defaults for devel module
# This class is loaded in all the classes that use the values set here
#
class devel::params  {

## DEFAULTS FOR VARIABLES USERS CAN SET
# (Here are set the defaults, provide your custom variables externally)
# (The default used is in the line with '')

###
### EXTRA MODULE INTERNAL VARIABLES
###
# (add here module specific internal variables)

    $rpm_list   = [
                    "curl-devel",
                    "expat-devel",
                    "gettext-devel",
                    "openssl-devel",
                    "zlib-devel",
                    "kernel-devel",
                    "kernel-headers",
                    "glibc-headers",
                    "make",
                    "gcc",
                    "rpm-build",
                    "rpm-devel",
                  ]
    # curl -> openssl -> zlib

    # TODO: verify debian/ubuntu
    $deb_list = [ "libcurl4-gnutls-dev",
                  "libexpat1-dev",
                  "gettext",
                  "libssl-dev",
                  "libz-dev",
                  "make",
                  "gcc",
                ]

###
### MODULE INTERNAL VARIABLES
###
# (Modify to adapt to unsupported OSes)

    $pkg_name = $operatingsystem ? {
        debian     => $deb_list,
        ubuntu     => $deb_list,
        redhat     => $rpm_list,
        centos     => $rpm_list,
        default    => $rpm_list,
    }

}

# vim:ft=puppet:


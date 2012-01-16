# Class devel3::params
#
# Sets internal variables and defaults for devel3 module
# This class is loaded in all the classes that use the values set here
#
class devel3::params  {

    # curl -> openssl -> zlib
    # glibc-devel -> glibc-headers
    $rpm_list = [
        "curl-devel",
        "expat-devel",
        "gettext-devel",
        "openssl-devel",
        "zlib-devel",
        "kernel-devel",
        "kernel-headers",
        "glibc-devel",
        "glibc-headers",
        "make",
        "gcc",
        "rpm-build",
        "rpm-devel",
    ]

}

# vim:ft=puppet:


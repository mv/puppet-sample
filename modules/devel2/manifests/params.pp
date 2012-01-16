# Class devel2::params
#
# Sets internal variables and defaults for devel2 module
# This class is loaded in all the classes that use the values set here
#
class devel2::params  {

    # curl -> openssl -> zlib
    # glibc-devel -> glibc-headers
    $rpm_prereq1 = [
        "zlib-devel.x86_64",
        "kernel-headers.x86_64",
        "glibc-headers.x86_64",
    ]

    $rpm_prereq2 = [
        "openssl-devel.x86_64",
        "glibc-devel.x86_64",
        "make",
    ]

    $rpm_prereq3 = [
        "curl-devel.x86_64",
        "expat-devel.x86_64",
        "gettext-devel.x86_64",
        "gcc",
        "kernel-devel.x86_64",
    ]

    $rpm_list = [
        "rpm-build",
        "rpm-devel",
    ]


}

# vim:ft=puppet:


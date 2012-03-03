# Class tools-dev::params
#
# Sets internal variables and defaults for tools-dev module
# This class is loaded in all the classes that use the values set here
#
class tools-dev::params  {

    # curl -> openssl -> zlib
    # glibc-devel -> glibc-headers
    $rpm_list = [
        "make",
        "gcc",
        "bison",
        "rpm-build",
        "rpm-devel",
    ]

}

# vim:ft=puppet:


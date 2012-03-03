# Class tools-util::params
#
# Sets internal variables and defaults for tools-util module
# This class is loaded in all the classes that use the values set here
#
class tools-util::params  {

    $rpm_list = [
        "file",
        "dos2unix",
        "unix2dos",
        "which",
        "bzip2",
        "unzip",
        "zip",
    ]

}

# vim:ft=puppet:


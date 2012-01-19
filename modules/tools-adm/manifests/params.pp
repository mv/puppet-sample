# Class tools-adm::params
#
# Sets internal variables and defaults for tools-adm module
# This class is loaded in all the classes that use the values set here
#
class tools-adm::params  {

    $rpm_list = [
        "dstat",
        "sysstat",
        "screen",
        "dtach",
        "rdate",
        "traceroute",
    ]

}

# vim:ft=puppet:


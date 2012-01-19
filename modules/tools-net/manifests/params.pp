# Class tools-net::params
#
# Sets internal variables and defaults for tools-net module
# This class is loaded in all the classes that use the values set here
#
class tools-net::params  {

    $rpm_list = [
        "ftp",
        "lsof",
        "nc",
        "nmap",
        "rsync",
        "tcpdump",
        "telnet",
        "wget",
    ]

}

# vim:ft=puppet:


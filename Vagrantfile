# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant::Config.run do |config|

  # Every Vagrant virtual environment requires a box to build off of.
  config.vm.box = "centos57"

  # The url from where the 'config.vm.box' box will be fetched if it
  # doesn't already exist on the user's system.
  # config.vm.box_url = "http://domain.com/path/to/above.box"

  # Boot with a GUI so you can see the screen. (Default is headless)
  # config.vm.boot_mode = :gui

  config.vm.define :master do |master|
    master.vm.box = "centos57"
    master.vm.network("192.168.10.50", :netmask => "255.255.255.0" )
    master.vm.share_folder "v-modules"  , "/etc/puppet/modules"  , "modules"
    master.vm.share_folder "v-manifests", "/etc/puppet/manifests", "manifests"
    master.vm.boot_mode = :gui
  end

  config.vm.define :node1 do |node1|
    node1.vm.box = "centos57"
    node1.vm.network("192.168.10.51", :netmask => "255.255.255.0" )
    node1.vm.share_folder "v-modules"  , "/etc/puppet/modules"  , "modules"
    node1.vm.share_folder "v-manifests", "/etc/puppet/manifests", "manifests"
    node1.vm.boot_mode = :gui
  end

  # Enable provisioning with Puppet stand alone.  Puppet manifests
  # are contained in a directory path relative to this Vagrantfile.
  # You will need to create the manifests directory and a manifest in
  # the file centos57.pp in the manifests_path directory.
  #
  # An example Puppet manifest to provision the message of the day:
  #
  # # group { "puppet":
  # #   ensure => "present",
  # # }
  # #
  # # File { owner => 0, group => 0, mode => 0644 }
  # #
  # # file { '/etc/motd':
  # #   content => "Welcome to your Vagrant-built virtual machine!
  # #               Managed by Puppet.\n"
  # # }
  #
  # config.vm.provision :puppet do |puppet|
  #   puppet.manifests_path = "manifests"
  #   puppet.manifest_file  = "centos57.pp"
  # end

  # Enable provisioning with chef solo, specifying a cookbooks path (relative
  # to this Vagrantfile), and adding some recipes and/or roles.
  #
  # config.vm.provision :chef_solo do |chef|
  #   chef.cookbooks_path = "cookbooks"
  #   chef.add_recipe "mysql"
  #   chef.add_role "web"
  #
  #   # You may also specify custom JSON attributes:
  #   chef.json = { :mysql_password => "foo" }
  # end

end


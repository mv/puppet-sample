# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant::Config.run do |config|

  # Every Vagrant virtual environment requires a box to build off of.
  config.vm.box = "centos57"
  config.vm.box_url = "http://dl.dropbox.com/u/52955229/centos-5.7-x86_64-minimal-1.box"

  ###
  ### Puppet Master
  ###
  config.vm.define :master do |srv|
    srv.vm.box = "centos57"
    srv.vm.network :hostonly, "192.168.10.50"

    srv.vm.share_folder "v-modules"   , "/etc/puppet/modules"   , "./puppet/modules"
    srv.vm.share_folder "v-manifests" , "/etc/puppet/manifests" , "./puppet/manifests"
    # srv.vm.share_folder "v-pub"       , "/pub"                  , "/pub"
    # srv.vm.boot_mode = :gui

    # puppet script: set hostname
    srv.vm.provision :puppet do |puppet|
      puppet.manifests_path = "./puppet/modules/vagrant/"
      puppet.manifest_file  = "set-hostname-pp-master.pp"
    end

  end # master

  ###
  ### Puppet node1
  ###
  config.vm.define :node1 do |srv|
    srv.vm.box = "centos57"
    srv.vm.network :hostonly, "192.168.10.51"

    srv.vm.share_folder "v-modules"   , "/etc/puppet/modules"   , "./puppet/modules"
    srv.vm.share_folder "v-manifests" , "/etc/puppet/manifests" , "./puppet/manifests"
    # srv.vm.share_folder "v-pub"       , "/pub"                  , "/pub"
    # srv.vm.boot_mode = :gui

    # puppet script: set hostname
    srv.vm.provision :puppet do |puppet|
      puppet.manifests_path = "./puppet/modules/vagrant/"
      puppet.manifest_file  = "set-hostname-pp-node1.pp"
    end

  end # node1


end



# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure("2") do |config|

  config.vm.box = "precise64"
  config.vm.network :forwarded_port, guest: 8080, host: 8080
  config.vm.hostname = "vgLabUbuntu"
  config.vm.provision :puppet,:module_path => "modules"  do |puppet|
     puppet.manifests_path = "manifests"
     puppet.manifest_file  = "base.pp"
  end
end

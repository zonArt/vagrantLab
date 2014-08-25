# All Vagrant configuration is done here. The most common configuration
# options are documented and commented below. For a complete reference,
# please see the online documentation at vagrantup.com.

# -*- mode: ruby -*-
# vi: set ft=ruby :
# Vagrantfile API/syntax version. Don't touch unless you know what you're doing!
VAGRANTFILE_API_VERSION = "2"

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|

    config.vm.define :boxLab1 do |config|

        # Every Vagrant virtual environment requires a box to build off of.
        config.vm.box = "precise64"

        # The url from where the 'config.vm.box' box will be fetched if it
        # doesn't already exist on the user's system.
        #config.vm.box_url = ""

        config.vm.host_name = "boxLab1"

        # Define one non-internal network for VM-Host communication
        config.vm.network "private_network", ip: "10.240.21.100", virtualbox__intnet: false
        # Define one internal network for inter-VM communication
        config.vm.network "private_network", ip: "192.168.50.3", virtualbox__intnet: true

        config.vm.provider :virtualbox do |vb|
            # increase memory to 1GB (base box is set to 480MB)
            vb.customize ["modifyvm", :id, "--memory", 1024]
            # Ensure that the NAT DNS resolving is handled by something... Upgrading VirtualBox sometime disable the option...
            vb.customize ["modifyvm", :id, "--natdnshostresolver1", "on"]
        end

        # Use shell provisionner to prepare Hiera configuration so that Puppet can find it on the first run
        #config.vm.provision :shell, :inline => "ln -sf /vagrant/configuration/hiera-vagrantLab.yaml /etc/puppetlabs/puppet/hiera.yaml"
        
        # Use shell provisionner to make sure Ubuntu is up to date before provisioning
        config.vm.provision :shell, :inline => "sudo apt-get update"
        # Enable provisioning with Puppet stand alone.

        config.vm.provision :puppet do |puppet|
            puppet.manifests_path = "manifests"
            puppet.module_path = "modules"
            puppet.manifest_file  = "boxLab1.pp"
            puppet.facter = {
                "vagrant_box" => true
            }
        end
    end

    config.vm.define :cvMaker do |config|

        # Every Vagrant virtual environment requires a box to build off of.
        config.vm.box = "precise64"

        # The url from where the 'config.vm.box' box will be fetched if it
        # doesn't already exist on the user's system.
        #config.vm.box_url = ""

        config.vm.host_name = "cvMaker"

        # Define one non-internal network for VM-Host communication
        config.vm.network "private_network", ip: "192.168.56.4", virtualbox__intnet: false
        # Define one internal network for inter-VM communication
        config.vm.network "private_network", ip: "192.168.50.4", virtualbox__intnet: true

        config.vm.provider :virtualbox do |vb|
            # increase memory to 1GB (base box is set to 480MB)
            vb.customize ["modifyvm", :id, "--memory", 512, "--cpus", 1]
            # Ensure that the NAT DNS resolving is handled by something... Upgrading VirtualBox sometime disable the option...
            vb.customize ["modifyvm", :id, "--natdnshostresolver1", "on"]
        end

        # create hiera file in vagrant machine
        #config.vm.provision :shell, :inline => "ln -sf /vagrant/configuration/hiera-vagrantLab.yaml /etc/puppetlabs/puppet/hiera.yaml"

        # Use shell provisionner to make sure Ubuntu is up to date before provisioning
        config.vm.provision :shell, :inline => "sudo apt-get update"

        # Enable provisioning with Puppet stand alone.
        config.vm.provision :puppet do |puppet|
            puppet.manifests_path = "manifests"
            puppet.module_path = "modules"
            puppet.manifest_file  = "cvMaker.pp"
            puppet.facter = {
                "vagrant_box" => true
            }
        end
    end
end


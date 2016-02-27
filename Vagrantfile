# -*- mode: ruby -*-
# vi: set ft=ruby :

################################################################################
# Vagrant box definition begin
################################################################################
# Vagrantfile API/syntax version.
VAGRANTFILE_API_VERSION = "2"
Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|

  ################################################################################
  # Virtualbox
  ################################################################################
  # Prefer VirtualBox before digital_ocean, providers are used in the order listed
  # https://docs.vagrantup.com/v2/providers/basic_usage.html
  config.vm.provider "virtualbox"
  # Define machine type and box image
  config.vm.box = "ubuntu/trusty64"
  config.vm.box_url = "https://atlas.hashicorp.com/ubuntu/boxes/trusty64"

  # Web Server VM Configuration
  config.vm.define "machine" do |machine|
    machine.ssh.forward_agent = true

    machine.vm.network "private_network", ip: "10.10.10.10"
    machine.vm.synced_folder "salt", "/srv/salt"

    # Salt Provisioner
    machine.vm.provision :salt do |salt|
      # Relative location of configuration file to use for minion
      salt.minion_config = "salt/etc/machine.conf"
      # Highstate basicly means "comapre the VMs current machine state against 
      # what it should be and make changes if necessary".
      salt.run_highstate = true
      # Vagrant 1.7.4 Fix - alternatively use 1.7.2 and comment out the line below
      salt.bootstrap_options = '-F -c /tmp/ -P'
      # Run in verbose mode, so it will output all debug info to the console.
      # salt.verbose = true
    end
  end
end

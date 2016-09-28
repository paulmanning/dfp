# -*- mode: ruby -*-
# vi: set ft=ruby :

# This Vagrantfile is used to test the install script
# to use this just vagrant up, and it should provision
# a new Sierra vm and set up the dev box

Vagrant.configure("2") do |config|
  config.vm.box = "jhcook/macos-sierra"
  config.vm.network  "public_network", bridge: "en0: Wi-Fi (AirPort)"
  config.vm.synced_folder  ".", "/Users/vagrant/dotfiles", type: "rsync"
  #config.ssh.username = 'vagrant'
  #config.ssh.password = 'vagrant'
  #config.ssh.insert_key="true"
  #config.vm.provision "shell", inline: <<-SHELL
  #   cd dotfiles
  #   sudo ./install.sh
  # SHELL
end

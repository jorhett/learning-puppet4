# -*- mode: ruby -*-
# vi: set ft=ruby :

# Vagrantfile API/syntax version. Don't touch unless you know what you're doing!
VAGRANTFILE_API_VERSION = "2"
Vagrant.require_version ">= 1.5.2"

# Copy files into place
$copyscript = <<SCRIPT
cp -r /vagrant/etc-puppet/* /etc/puppet/ > /dev/null
SCRIPT

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
  config.vm.box = "centos65"

  # Default client
  config.vm.define "client", primary: true do |client|
    client.vm.hostname = "client"
    client.vm.network :private_network, ip: "192.168.250.10"
    client.vm.provision "shell", inline: $copyscript
  end
end

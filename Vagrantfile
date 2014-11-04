# -*- mode: ruby -*-
# vi: set ft=ruby :

# Vagrantfile API/syntax version. Don't touch unless you know what you're doing!
VAGRANTFILE_API_VERSION = "2"
Vagrant.require_version ">= 1.5.2"

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
  config.vm.box = "centos65"

  # Default client
  config.vm.define "client", primary: true do |client|
    client.vm.hostname = "client"
    client.vm.network :private_network, ip: "192.168.250.10"
  end

  # A puppetmaster
  config.vm.define "puppetmaster", autostart: false do |puppetmaster|
    puppetmaster.vm.hostname = "puppetmaster"
    puppetmaster.vm.network :private_network, ip: "192.168.250.1"
  end

  # Some web servers
  (1..3).each do |num|
    config.vm.define "web#{num}", autostart: false do |webserver|
      webserver.vm.hostname = "web#{num}"
      webserver.vm.network :private_network, ip: "192.168.250.2#{num}"
    end
  end

  # Puppet Dashboard
  config.vm.define "dashboard", autostart: false do |dashboard|
    dashboard.vm.hostname = "dashboard"
    dashboard.vm.network :private_network, ip: "192.168.250.2"
  end
end

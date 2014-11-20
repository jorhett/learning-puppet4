# -*- mode: ruby -*-
# vi: set ft=ruby :

# Vagrantfile API/syntax version. Don't touch unless you know what you're doing!
VAGRANTFILE_API_VERSION = "2"
Vagrant.require_version ">= 1.5.2"

# Copy files into place
$setupscript = <<END
  # Install puppet.conf in user directory to quiet deprecation warnings
  mkdir /home/vagrant/.puppet
  cp /vagrant/etc-puppet/puppet.conf /home/vagrant/.puppet/
  chown -R vagrant:vagrant /home/vagrant/.puppet
  # Install puppet.conf and example hiera settings in global directory
  mkdir /etc/puppet
  cp -r /vagrant/etc-puppet/* /etc/puppet/
  chown -R vagrant:vagrant /etc/puppet/hiera*
  # Provide the URL to the Puppet Labs yum repo on login
  echo "

You should start by installing the Puppet Labs Yum repo and Puppet
   sudo yum install -y http://yum.puppetlabs.com/puppetlabs-release-el-6.noarch.rpm
   sudo yum install -y puppet
   
" > /etc/motd
END

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
  config.vm.box = "centos65"

  # Default client
  config.vm.define "client", primary: true do |client|
    client.vm.hostname = "client.example.com"
    client.vm.network :private_network, ip: "192.168.250.10"
    client.vm.provision "shell", inline: $setupscript
  end

  # A puppetmaster
  config.vm.define "puppetmaster", autostart: false do |puppetmaster|
    puppetmaster.vm.hostname = "puppetmaster.example.com"
    puppetmaster.vm.network :private_network, ip: "192.168.250.5"
    puppetmaster.vm.provision "shell", inline: $setupscript
  end
end

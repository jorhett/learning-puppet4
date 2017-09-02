# -*- mode: ruby -*-
# vi: set ft=ruby :

# Vagrantfile API/syntax version. Don't touch unless you know what you're doing!
VAGRANTFILE_API_VERSION = "2"
Vagrant.require_version ">= 1.9.8"

# Copy files into place
$setupscript = <<END
  # Hardlock domain name
  echo 'supercede domain-name "example.com";' > /etc/dhcp/dhclient.conf

  # Install etc/hosts for convenience
  cp /vagrant/etc-puppet/hosts /etc/hosts

  # Add /opt/puppetlabs to the sudo secure_path
  sed -i -e 's#\(secure_path = .*\)$#\1:/opt/puppetlabs/bin#' /etc/sudoers

  # Install puppet.conf in user directory to share code directory
  mkdir -p /home/vagrant/.puppetlabs/etc/puppet
  cp /vagrant/etc-puppet/personal-puppet.conf /home/vagrant/.puppetlabs/etc/puppet/puppet.conf
  chown -R vagrant:vagrant /home/vagrant/.puppetlabs

  # Install helpful Puppet settings in global directory
  mkdir -p /etc/puppetlabs/puppet
  cp /vagrant/etc-puppet/puppet.conf /etc/puppetlabs/puppet/

  # Provide the URL to the Puppet Labs yum repo on login
  echo "
You should start by enabling the Puppet Labs Puppet Collection 1 release repo
   sudo yum install http://yum.puppetlabs.com/puppetlabs-release-pc1-el-7.noarch.rpm

Then install Puppet Agent and its companion packages
   sudo yum install -y puppet-agent
   
" > /etc/motd
  # Enable MotD
  sed -i -e 's/^PrintMotd no/PrintMotd yes/' /etc/ssh/sshd_config
  systemctl reload sshd
END

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
  config.vm.box = "centos/7"
  config.vm.provider :virtualbox do |vb|
    vb.customize ["modifyvm", :id, "--natdnsproxy1", "off"]
    vb.customize ["modifyvm", :id, "--natdnshostresolver1", "off"]
  end

  # clients
  config.vm.define "client", primary: true do |client|
    client.vm.hostname = "client.example.com"
    client.vm.network :private_network, ip: "192.168.250.10"
    client.vm.provision "shell", inline: $setupscript
  end

  config.vm.define "web1", primary: true do |webserver|
    webserver.vm.hostname = "web1.example.com"
    webserver.vm.network :private_network, ip: "192.168.250.21"
    webserver.vm.provision "shell", inline: $setupscript
  end
  config.vm.define "web2", primary: true do |webserver|
    webserver.vm.hostname = "web2.example.com"
    webserver.vm.network :private_network, ip: "192.168.250.22"
    webserver.vm.provision "shell", inline: $setupscript
  end
  config.vm.define "web3", primary: true do |webserver|
    webserver.vm.hostname = "web3.example.com"
    webserver.vm.network :private_network, ip: "192.168.250.23"
    webserver.vm.provision "shell", inline: $setupscript
  end

  # A puppetmaster
  config.vm.define "puppetmaster", autostart: false do |puppetmaster|
    puppetmaster.vm.hostname = "puppetmaster.example.com"
    puppetmaster.vm.network :private_network, ip: "192.168.250.5"
    puppetmaster.vm.provision "shell", inline: $setupscript
  end

  # Puppet Server
  config.vm.define "puppetserver", autostart: false do |puppetserver|
    puppetserver.vm.hostname = "puppetserver.example.com"
    puppetserver.vm.network :private_network, ip: "192.168.250.6"
    puppetserver.vm.provision "shell", inline: $setupscript
    puppetserver.vm.provider :virtualbox do |ps|
      ps.memory = 1024
    end
  end

  # Puppet Dashboard
  config.vm.define "dashboard", autostart: false do |puppetserver|
    puppetserver.vm.hostname = "dashserver.example.com"
    puppetserver.vm.network :private_network, ip: "192.168.250.7"
    puppetserver.vm.provision "shell", inline: $setupscript
    puppetserver.vm.provider :virtualbox do |ps|
      ps.memory = 1024
    end
  end
end

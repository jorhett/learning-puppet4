#!/bin/bash
echo "Installing editors and utilities useful for the lessons"
sudo yum install -q -y vim nano emacs-nox
sudo yum install -q -y rsync git ruby rubygems rake
echo ""
echo "Installing Puppet"
sudo yum install -q -y http://yum.puppetlabs.com/puppetlabs-release-pc1-el-7.noarch.rpm
sudo yum install -q -y puppet-agent
echo ""
echo "Enabling convenience symlinks."
sudo ln -s /opt/puppetlabs/bin/puppet /usr/bin/puppet
sudo ln -s /opt/puppetlabs/bin/facter /usr/bin/facter
sudo ln -s /opt/puppetlabs/bin/mco /usr/bin/mco
echo "Changing owner of /etc/puppetlabs to vagrant user"
sudo chown -R vagrant:vagrant /etc/puppetlabs
exit 0

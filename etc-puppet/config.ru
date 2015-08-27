# a config.ru, for use with Puppet 4

# Set the load path of the Puppet All-in-One Installation
$LOAD_PATH.unshift('/opt/puppetlabs/puppet/lib/ruby/vendor_ruby')

# run the master face of Puppet
$0 = "master"

# ARGV << "--debug" # if you want debugging
ARGV << "--rack"

# Rack applications typically don't start as root.  Set --confdir, --vardir,
# --logdir, --rundir to prevent reading configuration from ~puppet/
ARGV << "--confdir" << "/etc/puppetlabs/puppet"
ARGV << "--codedir" << "/etc/puppetlabs/code"
ARGV << "--vardir"  << "/var/opt/puppetlabs/puppetserver"
ARGV << "--logdir"  << "/var/log/puppetlabs/puppetmaster"
ARGV << "--rundir"  << "/var/run/puppetlabs/puppetmaster"

# always_cache_features is a performance improvement
# This is intended to allow agents to recognize new features that may be
# delivered during catalog compilation.
ARGV << "--always_cache_features"

# Finish by calling run
require 'puppet/util/command_line'
run Puppet::Util::CommandLine.new.execute


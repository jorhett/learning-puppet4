$minute = fqdn_rand( 30, $facts['certname'] )
cron { 'puppet-agent':
  ensure  => present,
  command => '/opt/puppetlabs/bin/puppet agent --onetime --no-daemonize',
  user    => 'root',
  minute  => [ $minute, $minute+30 ]
}


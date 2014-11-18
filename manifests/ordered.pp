package { 'tcpdump':
  ensure  => present,
}

exec { 'installedmsg': }
  path        => ['/bin'],
  command     => 'echo Traceroute has been installed.',
  refreshonly => true,
  subscribe   => Package['tcpdump'],
}

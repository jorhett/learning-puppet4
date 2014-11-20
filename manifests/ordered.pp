package { 'tcpdump':
  ensure  => absent,
}

exec { 'installedmsg':
  path        => ['/bin'],
  command     => 'echo Tcpdump has been removed.',
  refreshonly => true,
  subscribe   => Package['tcpdump'],
  logoutput   => true,
}

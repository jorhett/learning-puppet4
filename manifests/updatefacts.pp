exec { 'update-facts':
  path       => ['/bin','/usr/bin',
  command    => 'facter –y > /etc/mcollective/facts.yaml',
  timeout    => '120',
  returns    => ['0'],
  onlyif     => 'test –f /etc/mcollective',
  logoutput  => on_failure,
  refreshonly => false,
}

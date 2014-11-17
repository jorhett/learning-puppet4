exec { 'update-facts':
  path       => ['/bin','/usr/bin',
  command    => 'facter –-yaml > /etc/mcollective/facts.yaml',
  timeout    => '120',
  returns    => ['0'],
  onlyif     => 'test –d /etc/mcollective',
  logoutput  => on_failure,
  refreshonly => false,
}

file { '/etc/hosts':
  audit  => ['content','owner','group'],
  backup => 'puppet',
  noop   => true,
}

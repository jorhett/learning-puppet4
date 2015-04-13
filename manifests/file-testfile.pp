file { '/tmp/testfile.txt':
  ensure  => present,
  mode    => '0644',
  content => 'holy cow!',
}

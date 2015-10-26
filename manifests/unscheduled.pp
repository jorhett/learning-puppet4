schedule { 'workhours':
  range => '08:00 - 17:00',
}

file { '/tmp/workhours.txt':
  ensure   => file,
  content  => 'Open for business',
  schedule => 'workhours',
}

exec { 'use file':
  path    => '/bin:/usr/bin',
  command => 'cat /tmp/workhours.txt',
  require => File['/tmp/workhours.txt'],
}

schedule { 'once-every-hour':
  period      => hourly,
  periodmatch => number,
  repeat      => 1,
}

file { '/tmp/test-number.txt':
  ensure   => file,
  schedule => 'once-every-hour',
}

schedule { 'sixty-minutes-apart':
  period      => hourly,
  periodmatch => distance,
  repeat      => 1,
}

file { '/tmp/test-distance.txt':
  ensure   => file,
  schedule => 'sixty-minutes-apart',
}

schedule { 'every-four-minutes':
  period      => hourly,
  periodmatch => distance,
  repeat      => 15,
}

file { '/tmp/test-four.txt':
  ensure   => file,
  schedule => 'every-four-minutes',
}

exec { 'remove files':
  path    => '/bin:/usr/bin',
  command => 'rm -f /tmp/test-number.txt /tmp/test-distance.txt /tmp/test-myrepeat.txt',
  onlyif  => ['test -f /tmp/test-number.txt', 'test -f /tmp/test-distance.txt', 'test -f /tmp/test-repeat.txt'],
}

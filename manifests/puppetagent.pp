package { 'puppet':
  ensure => latest,
  notify => Service['puppet'],
  tag    => 'puppet',
}

service { 'puppet':
  ensure    => running,
  enable    => true,
  subscribe => Package['puppet'],
  tag       => 'puppet',
}

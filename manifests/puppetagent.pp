package { 'puppet':
  ensure  => latest,
  before  => Service['puppet'],
  tag     => 'puppet',
}

service { 'puppet':
  ensure  => running,
  enable  => true,
  require => Package['puppet'],
  tag     => 'puppet',
}

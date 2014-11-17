package { 'puppet':
  ensure  => present,
  before  => Service['puppet'],
}

service { 'puppet':
  ensure  => stopped,
  enable  => false,
  require => Package['puppet'],
}

package { 'puppet':
  ensure => present,
  tag    => 'packages',
}

service { 'puppet':
  ensure  => stopped,
  enable  => false,
}


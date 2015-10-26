file { '/home':
  ensure => directory,
  owner  => 'root',
}

mount { '/home':
  ensure  => 'mounted',
  fstype  => 'nfs',
  device  => 'netapp:/home',
  require => File['/home'],
}
  
$users = {
  'root' => { 
    'home' => '/home/root',
    'uid' => 0,
    'shell' => '/bin/bash'
  }
}

$users.each |$user,$config| { 
  user { $user:
    uid    => $config['uid'],
    home   => $config['home'],
    shell  => $config['shell'],
    require => Mount['/home'],
  }
}


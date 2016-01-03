# Always set a default value
$status  = lookup({ name => 'puppet::status',  default_value => 'running' })
$enabled = lookup({ name => 'puppet::enabled', default_value => true })

notify { 'puppet-settings': 
  message => "Status should be ${status}, start at boot ${enabled}.",
}

# Now the same code can be used regardless of the value
service { 'puppet':
  ensure => $status,
  enable => $enabled,
}

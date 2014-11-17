# Always set a default value
$running = hiera('puppet_running','running')
$startatboot = hiera('puppet_startatboot','true')

# Now the same code can be used regardless of the value
service { 'puppet':
  ensure => $running,
  enable => $startatboot,
}

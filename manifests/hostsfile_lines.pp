$hosts_line = '192.168.250.6 puppetserver.example.com puppet.example.com'
$host = $hosts_line.split(' ')
with( $host[0], $host[1], $host[2,-1] ) |$ipaddr, $hostname, *$aliases| {
  $alias_display = join($aliases,',')
  notice( "Host ${hostname} has IP ${ipaddr} and aliases ${alias_display}" )
}


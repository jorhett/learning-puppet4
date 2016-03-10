$hosts_line = '192.168.250.6 puppetserver.example.com puppet.example.com puppetserver'
$host = $hosts_line.split(' ')
with( *$host ) |$ipaddr, $hostname, *$aliases| {
  notice( "Host ${hostname} has IP ${ipaddr} and aliases ${aliases}" )
}


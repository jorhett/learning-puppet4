$ips = $facts.filter |$key,$value| { 
  $key =~ /^ipaddress6?_/
}
$private_ips = $ips.filter |$interface, $address| { 
  $address =~ /^(10|172\.(?:1[6-9]|2[0-9]|3[0-1])|192\.168)\./ or $address =~ /^fe80::/
}
$private_ips.each |$ip_interface,$address| {
  $interface = regsubst( $ip_interface, '^ipaddress6?_(\w+)', '\1' )
  notice( "interface ${interface} has private IP ${address}" )
}

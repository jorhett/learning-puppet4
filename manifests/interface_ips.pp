# Output a list of interfaces which have IPs
split( $facts['interfaces'], ',' ).each |$interface| { 
  if( $facts["ipaddress_${interface}"] != '' ) {
    notice( sprintf( "Interface %s has IPv4 address %s", $interface, $facts["ipaddress_${interface}"] ) )
  }
  if( $facts["ipaddress6_${interface}"] != '' ) {
    notice( sprintf( "Interface %s has IPv6 address %s", $interface, $facts["ipaddress6_${interface}"] ) )
  }
}

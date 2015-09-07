split( $facts['interfaces'], ',' ).each |$index, $interface| { 
  notice( "Interface #${index} is ${interface}" )
}

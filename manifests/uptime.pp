each( $facts['system_uptime'] ) |$type, $value| {
   notice( "System has been up ${value} ${type}" )
}

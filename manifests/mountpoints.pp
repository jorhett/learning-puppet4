each( $facts['partitions'] ) |$name, $device| {
  notice( "${facts['hostname']} has device ${name} with size ${device['size']}" )
}

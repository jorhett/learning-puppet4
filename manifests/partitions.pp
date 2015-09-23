$total_disk_space = $facts['partitions'].reduce(0) |$total, $partition| {
   notice( "partition ${partition[0]} is size ${partition[1]['size']}" )
   $total + $partition[1]['size_bytes']
}
$printable_space = sprintf( '%.2f', $total_disk_space/1024/1024/1024)
notice( "Total disk space = ${printable_space} GiB" )

notice('First do a slice(2) with a single $item accepting an array: ')
[1,2,3,4,5,6].slice(2) |$item| {
   notice( "\$item[0] = ${item[0]}" )
   notice( "\$item[1] = ${item[1]}" )
}

notice('Now do a slice(2) with $one and $two each accepting a single value:')
[1,2,3,4,5,6].slice(2) |$one, $two| {
   notice( "\$one == ${one}" )
   notice( "\$two == ${two}" )
}


$numbers = [12,23,34,45,56,78,89,900]

# example use of next to avoid factoring large numbers
$factors = $numbers.map() |$num| {
  if( $num % 2 == 0 ) {
    next( [2, $num / 2] ) # return early for even numbers
  }
  get_factors( $num ) # expensive computation
}
notice( "next loop: ${factors}" )

# example use of break to avoid factoring large numbers
$factors_break = $numbers.sort().map() |$num| {
  if( Integer($num) > 100 ) {
    break()
  }
  get_factors( $num ) # expensive computation
}
notice( "break loop: ${factors_break}" )

# example use of return to stop evaluation when to avoid factoring large numbers
function get_factors( $num ) {
  # Use a lambda to evaluate the value cast to Integer
  with( Integer($num) ) |$int| {
    if( $int % 2 == 0 ) {
      return( [2, $int / 2] ) # return from enclosing function get_factors()
    }
  }
  # do expensive factoring
  "FACTORS-OF-${num}"
}
notice( $numbers.map |$num| { get_factors($num) } )

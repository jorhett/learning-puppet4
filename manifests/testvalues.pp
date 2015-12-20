#$password = '42095y234209438'
$password = 42095234209438
with($password) |String[12] $secret| {
  notice( "The secret '${secret}' is a sufficiently long password." )
}

$input_value = '5'
case $input_value {
  Integer: { notice('Input plus ten equals ' + ($input_value+10) ) }
  String:  { notice('Input was a string, unable to add ten.') }
}

$input = 'myname'
if( $input =~ Variant[ String, Array[String] ] ) {
  notice( 'Values are strings.' )
}
if( $input =~ Optional[Integer] ) {
  notice( 'Values is a whole number or undefined.' )
}

notice( 'text' =~ String ) # exact
notice( 'text' =~ Scalar ) # Strings are children of Scalar type
notice( 'text' =~ Data )   # Scalars are a valid Data type
notice( 'text' =~ Object ) # all types are Objects

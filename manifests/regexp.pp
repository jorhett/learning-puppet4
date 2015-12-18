$matchme = 'fire23 and flood'
if( $matchme =~ /(?x:fi \w+ flood)/ ) {
  notice( 'matches (?x:fi \w+ flood)' )
}
if( $matchme =~ /(?x:fi \w+ \d+)/ ) {
  notice( 'matches (?x:fi \w+ \d+)' )
}
if( $matchme =~ /(?x:fire \w+ flood)/ ) {
  notice( 'matches (?x:fire \w+ flood)' )
}
if( $matchme =~ /fire \w+ flood/ ) {
  notice( 'matches /fire \w+ flood/' )
}

$matchit = 'fog'
if( $matchit =~ /(?x:fo \w $)/ ) {
  notice( 'matchit = /fo\w$/' )
}
if( $matchit =~ /fo \w+ $/ ) {
  notice( 'matchit = /fo\w+$/' )
}
$crisis = "Fire\nFlood"
if( $crisis =~ /(?imx:fire . flood)/ ) {
  notice( 'multiline match.' )
}

$item = 'food'
if /[\w\-]+ food/ =~ Regexp["[\\w\\-]+ ${item}"] {
  notice( "/\\w+ food/ is an ${item} regexp" )
}
notice( Regexp["[\\w\\-]+ ${item}"] )

if /foo/ =~ Regexp {
  notice( '/foo/ is a regexp' )
}
if 'foo' =~ Regexp {
  notice( "'foo' is a regexp" )
}
$input = /food/
if $input =~ Regexp {
  notice( "${input} is a regexp" )
}
if $input =~ Regexp[/fod/] {
  notice( 'matches /fod/' )
}
if $input =~ Regexp[/foo/] {
  notice( 'matches /foo/' )
}
if $input =~ Regexp[/food/] {
  notice( 'matches /food/' )
}

$drink_du_jour = 'coffe'
$you_drank = 'started with coffee'

if( $you_drank =~ "${drink_du_jour}$" ) {
  notice( 'drank coffee' )
}

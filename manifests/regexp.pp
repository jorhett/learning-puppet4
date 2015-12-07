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

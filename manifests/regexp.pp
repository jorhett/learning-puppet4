$input = /food/
if $input =~ Regexp {
  notice( 'is a regexp' )
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

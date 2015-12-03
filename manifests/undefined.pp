$undef_defined = undef

notice( $undef_defined )   # no error
notice( $never_defined )   # will produce a warning
notice( 'passed' )         # won't get to here

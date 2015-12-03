class other_class( String $idea ) {
  $sentence = "an idea: ${idea}"
  notify { 'announcement': message => "I have ${sentence}" }
}

class my_class {
  # I can see the other class parameter
  notice( "The idea was: ${Class['other_class']['idea']}" )

  # I can see the other class variables
  notice( "The sentence was: ${::other_class::sentence}" )

  # I can see parameters of resources in another class
  notice( "The entire message was: ${Notify['announcement']['message']}" )
}

class { 'other_class':
  idea => 'games!',
}
include my_class

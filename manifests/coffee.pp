notify { 'need_coffee':
  message => "I need a cup of coffee. Come remind me in ${fqdn_rand(10)} minutes.",
}

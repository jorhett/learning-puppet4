exec { 'echo-holy-cow':
  path      => ['/bin'],
  cwd       => '/tmp',
  command   => 'echo "holy cow!" > testfile.txt',
  creates   => '/tmp/testfile.txt',
  returns   => [0],
  logoutput => on_failure,
}

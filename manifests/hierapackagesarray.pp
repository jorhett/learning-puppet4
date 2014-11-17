# Get a list of packages
$installoptions = { ensure => 'present' }
$packagelist = hiera_array('packages_to_install',undef);

# Now the same code can be used regardless of the value
if( packagelist ) {
  create_resources( package, $packagelist, $installoptions )
}

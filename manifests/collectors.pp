# Regenerate the facts whenever any package is added or removed
Package <||> ~> Exec['update-facts']

# Ensure the puppetlabs repo is installed before any packages
# used in the puppet or mcollective modules
Yumrepo['puppetlabs'] -> Package <| tag == 'puppet' |>
Yumrepo['puppetlabs'] -> Package <| tag == 'mcollective' |>

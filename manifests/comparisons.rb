if 'Coffee' == 'coffee' {                   # string comparisons are case insensitive
  notice('Coffee == coffee')
}

if 'tea' in 'coffee' {                      # you can't find tea in coffee
  notice('There is tea in coffee')
}
else {
  notice('There is tea in coffee')
}

if 'Fee' in 'coffee' {                      # substring matches are case insensitive
  notice('There is a Fee in coffee')
}
else {
  notice('There is a no Fee in coffee')
}

if 'Touch' in 'touche' {                    # substring matches are case insensitive
  notice('There is a Touch in touche')
}

if 'touch' in "touch\u00e9" {                # substring ascii matches are case in sensitive
  notice("And a touch in touch\u00e9")
}

if !("touch\u00c9" in "touch\u00e9") {       # UTF char matches are case sensitive
  notice("But no touch\u00c9 in touch\u00e9")
}

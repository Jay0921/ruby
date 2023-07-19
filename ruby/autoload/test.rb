# References: https://medium.com/rubycademy/the-autoload-method-in-ruby-11fd079562ef
# Make sure to execute this file in this directory, otherwise it won't work!

module Test
  autoload(:A, './a.rb')

  # The autoload method adds module into internal hash table
  p constants
  # [:A]

  p "The A module isn't yet loaded!"
  A
  p "The A module has been successfully loaded!"

  # The :A constant is now removed from the internal hash table after it has been loaded
  p constants
  # []
end

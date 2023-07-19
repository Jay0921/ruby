autoload(:A, './a.rb')

module Test3
  p autoload? :A
  # This returns nil because the module A is not in the Test3 namespace.
end

p autoload? :A

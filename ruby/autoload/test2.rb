module Test2
  autoload(:B, './b.rb')

  p autoload?(:B)
  B
  p autoload?(:B)
end

require_relative 'original'
require "pry"

class Original
  def greet
    'Hello, I am monkey patched.'
  end
end

original = Original.new
puts original.greet
# Hello, I am monkey patched.
puts original.this_remain_the_same
# This remain the same.

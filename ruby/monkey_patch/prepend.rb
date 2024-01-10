require_relative 'original'
require "pry"

module Prepend
  def greet
    'Hello, I am monkey patched.'
  end
end

Original.prepend(Prepend)

original = Original.new
puts original.greet
# Hello, I am monkey patched.
puts original.this_remain_the_same
# This remain the same.

Original.ancestors
# [Prepend, Original, Object, PP::ObjectMixin, Kernel, BasicObject]

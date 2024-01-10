require_relative 'original'
require 'active_support/concern'
require "pry"

module Extension
  extend ActiveSupport::Concern

  included do
    def greet
      'Hello, I am monkey patched.'
    end
  end
end

Original.include(Extension)
original = Original.new
puts original.greet
# Hello, I am monkey patched.
puts original.this_remain_the_same
# This remain the same.

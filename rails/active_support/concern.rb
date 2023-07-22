require "active_support/concern"
require "pry"

module ActiveSupport
  module Concern
    def self.extended(base)
      # puts "extended: #{base}"
      base.instance_variable_set(:@_dependencies, [])
    end

    def append_features(base) # :nodoc:
      puts "append_features: #{base}, #{self}"
      if base.instance_variable_defined?(:@_dependencies)
        puts "add @_dependencies: #{self}"
        base.instance_variable_get(:@_dependencies) << self
        false
      else
        return false if base < self
        puts "include @_dependencies: #{@_dependencies}"
        @_dependencies.each { |dep| base.include(dep) }
        super
        base.extend const_get(:ClassMethods) if const_defined?(:ClassMethods)
        base.class_eval(&@_included_block) if instance_variable_defined?(:@_included_block)
      end
    end

    def included(base = nil, &block)
      # puts "included: #{base}"
      # puts "self: #{self}"
      # puts "base: #{base}"
      # puts "@_included_block: #{instance_variable_defined?(:@_included_block)}"
      if base.nil?
        if instance_variable_defined?(:@_included_block)
          if @_included_block.source_location != block.source_location
            raise MultipleIncludedBlocks
          end
        else
          @_included_block = block
        end
      else
        # puts "Calling super method"
        super
      end
      # puts "source_location: #{@_included_block&.source_location}"
      # puts "===================="
    end
  end
end

# Without ActiveSupport::Concern, we need to write the following code:
# module Foo
#   def self.included(base)
#     base.class_eval do
#       def self.method_injected_by_foo
#         puts "method_injected_by_foo"
#       end
#     end
#   end
# end

# module Bar
#   def self.included(base)
#     base.method_injected_by_foo
#   end
# end

# class Host
#   include Foo # We need to include this dependency for Bar
#   include Bar # Bar is the module that Host really needs
# end


# With ActiveSupport::Concern, we can write the following code:
module Foo2
  extend ActiveSupport::Concern

  included do
    def self.method_injected_by_foo
      puts "method_injected_by_foo2"
    end
  end
end

module Bar2
  extend ActiveSupport::Concern
  include Foo2

  included do
    self.method_injected_by_foo
  end
end

class Host2
  include Bar2 # It works, now Bar takes care of its dependencies
end

# puts Host2.ancestors

# module Bar3
#   extend ActiveSupport::Concern

#   included do
#     def self.greeting
#       puts "Hello, world!"
#     end
#   end
# end

# module Host3
#   include Bar3
# end
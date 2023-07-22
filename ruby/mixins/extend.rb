# extend adds the methods of a module as class methods

module Logging
  def self.extended(base)
    base.class_eval do
      @_test = "This is a test"

      def self.test
        @_test
      end

      def debug
        puts "Debugging..."
      end
    end
  end

  def log(message)
    puts "Logging: #{message}"
  end
end

class Service
  extend Logging
end

Service.ancestors
# [Service, Object, PP::ObjectMixin, Kernel, BasicObject]

Service.test
# This is a test

Service.new.debug
# Debugging...

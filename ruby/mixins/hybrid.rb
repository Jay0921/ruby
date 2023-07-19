# Sometimes we want to use a module not only to import instance
# methods into a class but also to define class methods.

module Logging
  module ClassMethods
    def logging_enabled?
      true
    end
  end

  def self.included(base)
    base.extend(ClassMethods)
  end

  def log(message)
    puts "Logging: #{message}"
  end
end

class Service
  include Logging
end

Service.ancestors
# [Service, Logging, Object, PP::ObjectMixin, Kernel, BasicObject]

Service.logging_enabled?
# true

Service.new.log('Hello, world!')
# Logging: Hello, world!

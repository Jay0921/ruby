# extend adds the methods of a module as class methods

module Logging
  def log(message)
    puts "Logging: #{message}"
  end
end

class Service
  extend Logging
end

Service.ancestors
# [Service, Object, PP::ObjectMixin, Kernel, BasicObject]

Service.log('Hello, world!')
# Logging: Hello, world!

# The prepend method adds the Logging module to the inheritance chain before the Service class.
# Therefore, when the log method is called on a Service instance, the log method in the Logging module is called.

module Logging
  def log(message)
    puts "Logging: #{message}"
  end
end

class Service
  prepend Logging

  def log(message)
    puts "Service: #{message}"
  end
end

Service.ancestors
# [Logging, Service, Object, PP::ObjectMixin, Kernel, BasicObject]

Service.new.log('Hello, world!')
# Logging: Hello, world!

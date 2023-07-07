# References: https://medium.com/@leo_hetsch/ruby-modules-include-vs-prepend-vs-extend-f09837a5b073
# include add the module methods as instance methods in the class

module Logging
  def log(message)
    puts "Logging: #{message}"
  end
end

module Debug
  def debug(message)
    puts "Debug: #{message}"
  end
end

class Service
  include Logging
  include Debug

  def log(message)
    puts "Service: #{message}"
  end
end

Service.ancestors
# [Service, Debug, Logging, Object, PP::ObjectMixin, Kernel, BasicObject]

service = Service.new
service.log('Hello, world!')
# Service: Hello, world!
service.debug('Hello, world!')
# Debug: Hello, world!

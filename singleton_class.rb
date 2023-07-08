# https://medium.com/@jeremy_96642/module-extend-understanding-ruby-singleton-classes-9dea718c80f2
# https://medium.com/@leo_hetsch/demystifying-singleton-classes-in-ruby-caf3fa4c9d91

# Instance singleton methods
class MyInstanceClass
end

my_instance_class = MyInstanceClass.new
my_instance_class2 = MyInstanceClass.new

def my_instance_class.new_method
  puts "This is the output of an object-specific method"
end

my_instance_class.new_method
my_instance_class.singleton_class.instance_methods.include?(:new_method)
# true
my_instance_class.singleton_methods
# [:new_method]

# my_instance_class2.new_method
# undefined method `new_method'
my_instance_class2.singleton_class.instance_methods.include?(:new_method)
# false
my_instance_class2.singleton_methods
# []




# Class singleton methods
class Vehicle
  @@registry = []

  class << self
    def register(vehicle)
      @@registry << vehicle
    end

    def registry
      @@registry
    end
  end

  def initialize(kms)
    @kms = kms
  end

  def drive
    puts "let's go!"
  end
end

class Car < Vehicle
  def self.register(car)
    puts "Registering a car"
    super
  end
end

Vehicle.singleton_methods
# [:register]
Vehicle.instance_methods.include?(:drive)
# true
Car.singleton_methods
# [:register]
Car.instance_methods.include?(:drive)
# true

car = Car.new(100)
car.methods.include?(:drive)
# true
car.singleton_class

Car.register(car)

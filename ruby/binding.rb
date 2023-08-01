require 'pry'

# binding at method level
def get_binding
  x = "method level"
  binding
end

# Get the binding object
my_binding = get_binding

# Use the binding object to access the local variable 'x'
puts my_binding.eval('x')
# ================================================================


# binding at calss level
class MyClass
  def self.get_binding
    x = "class level"
    binding
  end

  def self.evaluate_binding
    my_binding = get_binding
    my_binding.eval('x')
  end
end

# Call the class method
puts MyClass.evaluate_binding

# ========================================
# Class Eval
# ========================================
class Person
end

Person.class_eval do
  class << self
    def class_method
      puts "Hello from class method!"
    end
  end

  def instance_method
    puts "Hello from instance method!"
  end
end

Person.class_method
# => Hello from class method!
p = Person.new
p.instance_method
# => Hello from instance method!

# ========================================
# Instance Eval
# ========================================
class Post
end

Post.instance_eval do
  def class_method
    puts "Hello from class method!"
  end
end

Post.class_method
# => Hello from class method!

post = Post.new
post.instance_eval do
  def instance_method
    puts "Hello from instance method!"
  end
end

post.instance_method
# => Hello from instance method!

another_post = Post.new
# another_post.instance_method
# => NoMethodError: undefined method `instance_method' for an instance of Post

# ========================================
# Module Eval
# ========================================
# The module_eval method is just an alias to class_eval so you can use them both for classes and modules.

module ClassModule
end

module InstanceModule
end

class Blog
  extend ClassModule
  include InstanceModule
end

ClassModule.module_eval do
  def class_method
    puts "Hello from class method!"
  end
end

InstanceModule.module_eval do
  def instance_method
    puts "Hello from instance method!"
  end
end

Blog.class_method
# => Hello from class method!
Blog.new.instance_method
# => Hello from instance method!

# References: https://www.rubyguides.com/2016/02/ruby-procs-and-lambdas/

require 'pry'

# Ruby blocks are little anonymous functions that can be passed into methods.
def print_twice
  yield
  yield
end

print_twice { puts "Hello" }

def print_twice2(&block)
  block.call
  block.call
end

print_twice { puts "Hello2" }
# ================================================================


# Lambdas return from the lambda itself.
def call_lambda
  puts "Before lambda"
  my_lambda = -> { return 1 }
  puts my_lambda.call
  puts "After lambda"
end

call_lambda
# Before lambda
# 1
# After lambda
# ================================================================


# Procs return from the current method
def call_proc
  puts "Before proc"
  my_proc = Proc.new { return 1 }
  puts my_proc.call
  puts "After proc"
end

call_proc
# Before proc
# ================================================================


# proc in Ruby is like a portable container that holds values and methods from the context where it was created,
# allowing you to use them in different parts of your program.
def call_proc(my_proc)
  count = 500
  my_proc.call
end

count   = 1
my_proc = Proc.new { puts count }
p call_proc(my_proc)
# 1

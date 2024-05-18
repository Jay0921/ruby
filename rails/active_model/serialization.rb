require "active_model"
require "pry"

class Person
  include ActiveModel::Serialization

  attr_accessor :name, :age, :address

  def attributes
    {
      'name' => nil,
      'age' => nil,
      'address' => nil
    }
  end
end

person = Person.new
puts "person.serializable_hash:"
puts person.serializable_hash
# => {"name"=>nil}
puts "====="

person.name = 'Bob'
puts "person.serializable_hash:"
puts person.serializable_hash
# => {"name"=>"Bob"}

puts "========================================"

puts "person.serializable_hash(only: 'name'):"
puts person.serializable_hash(only: 'name')
# => {"name"=>"Bob"}
puts "====="

puts "person.serializable_hash(only: ['name', 'age']):"
puts person.serializable_hash(only: ['name', 'age'])
# => {"name"=>"Bob", "age"=>nil}

puts "========================================"

puts "person.serializable_hash(except: 'name'):"
puts person.serializable_hash(except: 'name')
# => {"age"=>nil, "address"=>nil}
puts "====="

puts "person.serializable_hash(except: ['name', 'age']):"
puts person.serializable_hash(except: ['name', 'age'])
# => {"address"=>nil}

require "active_model"
require "pry"

class Person
  include ActiveModel::Serializers::JSON

  attr_accessor :name, :age, :address, :cars

  def attributes
    {
      'name' => nil,
      'age' => nil,
      'address' => nil
    }
  end
end

class Car
  include ActiveModel::Serializers::JSON

  attr_accessor :model, :year

  def attributes
    {
      'model' => nil,
      'year' => nil
    }
  end
end


person = Person.new

puts "person.serializable_hash:"
puts person.serializable_hash
# => {"name"=>nil, "age"=>nil, "address"=>nil}
puts "====="

puts "person.as_json:"
puts person.as_json
# => {"name"=>nil, "age"=>nil, "address"=>nil}
puts "====="

puts "person.to_json:"
puts person.to_json
# => "{\"name\":null,\"age\":null,\"address\":null}"

puts "========================================"

person.name = 'Bob'

puts "person.serializable_hash:"
puts person.serializable_hash
# => {"name"=>"Bob", "age"=>nil, "address"=>nil}
puts "====="

puts "person.as_json:"
puts person.as_json
# => {"name"=>"Bob", "age"=>nil, "address"=>nil}
puts "====="

puts "person.to_json:"
puts person.to_json
# => "{\"name\":\"Bob\",\"age\":null,\"address\":null}"

puts "========================================"

car = Car.new
car.model = 'Ford'
car.year = '2010'

person.cars = [car]

puts "person.serializable_hash(include: :cars):"
puts person.serializable_hash(include: :cars)
# => {"name"=>"Bob", "age"=>nil, "address"=>nil, "cars"=>[{"model"=>"Ford", "year"=>"2010"}]}
puts "====="

puts "person.as_json(include: :cars):"
puts person.as_json(include: :cars)
# => {"name"=>"Bob", "age"=>nil, "address"=>nil, "cars"=>[{"model"=>"Ford", "year"=>"2010"}]}
puts "====="

puts "person.to_json(include: :cars):"
puts person.to_json(include: :cars)
# => "{\"name\":\"Bob\",\"age\":null,\"address\":null,\"cars\":[{\"model\":\"Ford\",\"year\":\"2010\"}]}"

puts "========================================"

puts "person.serializable_hash(include: { cars: { only: :model } })"
puts person.serializable_hash(include: { cars: { only: :model } })
# => {"name"=>"Bob", "age"=>nil, "address"=>nil, "cars"=>[{"model"=>"Ford"}]}
puts "====="

puts "person.as_json(include: { cars: { only: :model } })"
puts person.as_json(include: { cars: { only: :model } })
# => {"name"=>"Bob", "age"=>nil, "address"=>nil, "cars"=>[{"model"=>"Ford"}]}
puts "====="

puts "person.to_json(include: { cars: { only: :model } })"
puts person.to_json(include: { cars: { only: :model } })
# => "{\"name\":\"Bob\",\"age\":null,\"address\":null,\"cars\":[{\"model\":\"Ford\"}]}"

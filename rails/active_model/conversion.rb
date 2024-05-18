require "active_model"
require "pry"

class Person
  include ActiveModel::Conversion
  attr_accessor :id, :name

  def initialize(id, name)
    @id = id
    @name = name
  end

  def persisted?
    true
  end
end

person = Person.new(1, 'Bob')
puts "person.to_model: #{person.to_model}"
# => #<Person:0x007f9d2b0b5a98>
puts "person.to_key: #{person.to_key}"
# => [1]
puts "person.to_param: #{person.to_param}"
# => "1"
puts "person.to_partial_path: #{person.to_partial_path}"
# => "people/person"

require "active_model"

class Cat
  include ActiveModel::AttributeAssignment
  attr_accessor :name, :status
end

cat = Cat.new
cat.assign_attributes(name: "Gorby", status: "yawning")
cat.name # => 'Gorby'
cat.status # => 'yawning'
cat.assign_attributes(status: "sleeping")
cat.name # => 'Gorby'
cat.status # => 'sleeping'

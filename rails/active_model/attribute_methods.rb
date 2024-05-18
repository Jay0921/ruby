require "active_model"
require "pry"

class Person
  include ActiveModel::AttributeMethods

  attr_accessor :name, :age, :address
  attribute_method_suffix '_short?'
  attribute_method_prefix 'clear_'
  attribute_method_affix prefix: 'reset_', suffix: '_to_default!'
  define_attribute_methods :name, :age, :address

  alias_attribute :nickname, :name
  alias_attribute :years, :age

  private
    def attribute_short?(attr)
      send(attr).length < 5
    end

    def clear_attribute(attr)
      send("#{attr}=", nil)
    end

    def reset_attribute_to_default!(attr)
      send("#{attr}=", 'Default Name')
    end
end

person = Person.new
person.name = 'Bob'

person.name_short?
# => false

person.clear_name
puts person.name
# => nil

person.reset_name_to_default!
puts person.name
# => "Default Name"

Person.attribute_alias(:nickname)
# => "name"

Person.attribute_alias?(:nickname)
# => true

Person.alias_attribute(:new_name, :name)
puts person.new_name
# => "Default Name"
Person.attribute_alias(:new_name)
# => "name"

Person.aliases_by_attribute_name
# => {"name"=>["nickname", "new_name"], "age"=>["years"], "address"=>[]}

Person.undefine_attribute_methods

require "active_model"

class Person
  include ActiveModel::Validations

  attr_reader :name

  validates :name, presence: true
  validates :name, length: { minimum: 3, maximum: 5}
  validate :name_cannot_be_test_model

  def initialize(name:)
    @name = name
  end

  private

  def name_cannot_be_test_model
    errors.add(:name, "cannot be Test Model") if name == "Test Model"
  end
end

person = Person.new(name: "Test Model")
puts person.valid?
puts person.errors.full_messages

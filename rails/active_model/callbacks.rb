require 'active_model'

class Person
  extend ActiveModel::Callbacks

  define_model_callbacks :save

  before_save :before_save_method
  after_save :after_save_method

  def initialize(name:)
    @name = name
  end

  def save
    run_callbacks :save do
      puts "Saving the model..."
    end
  end

  private

  def before_save_method
    puts "Before save callback"
  end

  def after_save_method
    puts "After save callback"
  end
end

person = Person.new(name: "Test Model")
person.save

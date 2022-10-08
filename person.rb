require_relative './basedecorator'
require_relative './capitalizedecorator'
require_relative './trimmerdecorator'
require_relative './book'
require_relative './rental'
require_relative './nameable'

class Person < Nameable
  attr_reader :rentals, :id
  attr_accessor :name, :age

  def initialize(age, name)
    super()
    @id = Random.rand(1..1000)
    @name = name
    @age = age
    @rentals = []
  end

  def correct_name
    @name
  end

  def add_rentals(rental)
    @rentals << rental
    rental.person = self
  end

  def can_use_services?
    true
  end
end

# m = Person.new(34, "oikjhg")
# puts m

require_relative './basedecorator'
require_relative './capitalizedecorator'
require_relative './trimmerdecorator'
require_relative './classroom'
require_relative './book'
require_relative './rental'

class Person < Nameable
  attr_reader :rentals, :id
  attr_accessor :name, :age

  def initialize(age, name = 'Unknown', parent_permission: true)
    super()
    @id = Random.rand(1..1000)
    @name = name
    @age = age
    @parent_permission = parent_permission
    @rentals = []
  end

  private

  def of_age?
    @age >= 18
  end

  public

  def can_use_services?
    of_age? || @parent_permission
  end

  def correct_name
    @name
  end

  def add_rentals(rental)
    @rentals << rental
    rental.person = self
  end
end

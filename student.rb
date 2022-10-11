require './person'

class Student < Person
  attr_reader :classroom
  attr_accessor :age, :name, :parent_permission

  def initialize(age, name, parent_permission)
    super(age, name)
    @parent_permission = parent_permission
    @classroom = ''
  end

  def play_hooky
    "¯\(ツ)/¯"
  end

  def can_use_services?
    of_age? || @parent_permission
  end

  def classroom=(classroom)
    @classroom = classroom
    classroom.students << self unless classroom.students.include?(self)
  end

  private

  def of_age?
    @age >= 18
  end
end

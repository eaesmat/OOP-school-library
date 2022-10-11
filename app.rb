require_relative './book'
require_relative './rental'
require_relative './teacher'
require_relative './student'

class App
  attr_accessor :book, :teacher, :rentals, :student

  def initialize
    @books = []
    @people = []
    @rentals = []
  end

  def create_person
    print 'Do you want to create a student (1) or a teacher (2)? [input the number]: '
    n = gets.chomp.to_i
    create_student unless n == 2
    create_teacher unless n == 1
  end

  def create_book
    print 'Title: '
    title = gets.chomp.to_s
    print 'Author: '
    author = gets.chomp.to_s

    book = Book.new(title, author)
    @books << book
    puts 'Book created successfully'
  end

  def list_books
    if @books.length.positive?
      @books.each do |book|
        puts "Title: '#{book.title}', Author: #{book.author}"
      end
    else
      puts 'There are no books found'
    end
  end

  def list_people
    if @people.length.positive?
      @people.each do |person|
        puts "[#{person.class}] Name: #{person.name}\", ID: #{person.id}, Age: #{person.age}"
      end
    else
      puts 'There are no people found'
    end
  end

  def create_rental
    puts 'Select a book from the following list by number'
    @books.each_with_index do |book, index|
      puts "#{index}) Title: \"#{book.title}\", Author: #{book.author}"
    end
    selected_book = gets.chomp.to_i
    book = @books[selected_book]
    puts 'Select a person from the following list by number (not id)'
    @people.each_with_index do |person, index|
      puts "#{index}) [#{person.class}] Name: \"#{person.name}\", ID: #{person.id}, Age: #{person.age}"
    end
    selected_person = gets.chomp.to_i
    person = @people[selected_person]
    date = Time.now.strftime('%Y/%m/%d')
    puts "Date: #{date}"
    rental = Rental.new(date, book, person)
    @rentals << rental
    puts 'Book rented successfully'
  end

  def list_rentals
    puts 'Enter person ID: '
    person_id = gets.chomp.to_i

    rentals = @rentals.filter { |rental| rental.person.id == person_id }
    if @rentals.length.positive?
      rentals.each do |rental|
        puts 'Rentals: '
        puts "Date: #{rental.date}, Book \"#{rental.book.title}\" by #{rental.book.author}"
      end
    else
      puts 'No rentals found for this person'
    end
  end

  def exit_app
    puts 'Thank you for using this app'
    exit!
  end

  private

  def create_student
    print 'Age: '
    age = gets.chomp.to_i
    print 'Name: '
    name = gets.chomp.to_s
    print 'Has parent permission? [Y/N]: '
    permission = gets.chomp.to_s.upcase

    case permission
    when 'N'
      permission = false
    when 'Y'
      permission = true
    else
      print 'Has parent permission? [Y/N]: '
      permission = gets.chomp.to_s.upcase
    end

    student = Student.new(age, name, permission)
    @people << student
    puts 'Person created successfully'
  end

  def create_teacher
    print 'Age: '
    age = gets.chomp.to_i
    print 'Name: '
    name = gets.chomp.to_s
    print 'specialization: '
    specialization = gets.chomp.to_s

    teacher = Teacher.new(age, name, specialization)
    @people << teacher
    puts 'Person created successfully'
  end
end

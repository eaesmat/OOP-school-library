require_relative './app'

class Main
  def initialize
    @menu = App.new
  end

  def library_options
    print "Welcome to the School Library App!\n"
    @options = 0
    while @options != 7
      print "\nPlease choose an option by entering a number: \n"
      print "1 - list all books\n"
      print "2 - list all people\n"
      print "3 - create a person\n"
      print "4 - create a book\n"
      print "5 - create a rental\n"
      print "6 - list all rentals for a given person id\n"
      print "7 - exit\n"
      run_app
    end
  end

  # rubocop:disable Metrics/CyclomaticComplexity
  def run_app
    option = gets.chomp.to_i
    case option
    when 1
      @menu.list_books
    when 2
      @menu.list_people
    when 3
      @menu.create_person
    when 4
      @menu.create_book
    when 5
      @menu.create_rental
    when 6
      @menu.list_rentals
    when 7
      @menu.exit_app
    end
  end
  # rubocop:enable Metrics/CyclomaticComplexity
end

options = Main.new
options.library_options
options.run_app

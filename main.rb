require './app'

# rubocop:disable Metrics
def show_options
  puts 'Please choose an option by entering a number:'
  puts '1 -> List all books'
  puts '2 -> List all music albums'
  puts '3 -> List all movies'
  puts '4 -> List of games'
  puts '5 -> List all genres'
  puts '6 -> List all labels'
  puts '7 -> List all authors'
  puts '8 -> List all sources'
  puts '9 -> Create a book'
  puts '10 -> Create a music album'
  puts '11 -> Create a movie'
  puts '12 -> Create a game'
  puts '13 -> Create a genre'
  puts '14 -> Create a source'
  puts '15 -> Create a label'
  puts '16 -> Create an author'
  puts '17 -> Add a movie to a Source'
  puts '18 -> Add a music album to a genre'
  puts '19 -> Add a game to a label'
  puts '20 -> Add a book to a Author'
  puts '21 -> Exit'
end
# rubocop:enable Metrics

def print_options
  puts 'Please choose an option by entering a number:'
  input = gets.chomp.to_i
  if input == 21
    save_quit
  else
    @catalog_of_things.choose_option(input)
    puts
    print_options
    puts
  end
end

def main
  @catalog_of_things = App.new
  @catalog_of_things.open_files
  print_options
end

def save_quit
  puts 'Do you want to save data [y/n]!'
  save = gets.chomp.upcase == 'Y'
  @catalog_of_things.save_files if save
  puts 'Thank you for using this App!'
  exit
end

main

require './app'

class Main
  def initialize
    @main = 0
    @book = []
    @music_album = []
    @movie = []
    @game = []

    puts 'Welcome to Catalog My Things App!'
    puts
  end

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
    puts '9 -> Add a book'
    puts '10 -> Add a music album'
    puts '11 -> Add a movie'
    puts '12 -> Add a game'
    puts '13 -> Exit'
  end

  # rubocop:disable Metrics
  def select_option
    case @main
    when 1
      display_books
    when 2
      display_music_albums
    when 3
      display_movies
    when 4
      display_games
    when 5
      display_genres
    when 6
      display_labels
    when 7
      display_authors
    when 8
      display_sources
    when 9
      user_book_input
    when 10
      user_music_input
    when 11
      user_movie_input
    when 12
      user_game_input
    else
      if @main != 13
        puts 'Invalid input, please try again'
        puts
      end
    end
  end
  # rubocop:enable Metrics

  def main
    until @main == 13
      show_options
      @main = gets.chomp.to_i
    end
    puts 'Exiting session'
    puts 'Thank you for using the Catalog Of My Things App'
  end
end

main

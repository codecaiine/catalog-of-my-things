require 'json'
require './game'
require './item'
require './author'
require './music_album'
require './genre'
require './create_items'
require './display_items'

class App
  include CreateItems
  include DisplayItems
  include JsonHandlers

  def initialize
    @books = []
    @music_albums = []
    @movies = []
    @games = []
    @genres = []
    @sources = []
    @labels = []
    @authors = []
    puts 'Welcome to Catalog My Things App!'
    puts
  end

  # rubocop:disable Metrics
  def choose_option(input)
    case input
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
      create_book
    when 10
      create_music_album
    when 11
      create_movie
    when 12
      create_game
    when 13
      create_genre
    when 14
      create_source
    when 15
      create_label
    when 16
      create_author
    when 17
      add_movie_source
    when 18
      add_music_genre
    when 19
      add_game_label
    when 20
      add_book_author
    else
      puts 'Invalid input, please try again'
      puts
    end
  end

  # rubocop:enable Metrics
  def add_music_genre
    if @genres.any?
      print 'Enter 1 to create a new genre or 2 to select an existing one : '
      option = gets.chomp.upcase
      case option
      when '1'
        create_genre
      when '2'
        puts 'Select a genre from the list by index'
        display_genres
        option = gets.chomp
        @genres[option.to_i]
      else
        print 'Invalid entry'
      end
    else
      create_genre
    end
  end
end

require 'json'
class App
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

  def display_music_albums
    if @music_albums.length.zero?
      puts 'Sorry! There is no music album registered!'.upcase
    else
      puts 'List of all Music albums: \n'
      @music_albums.each_with_index do |album, index|
        puts '#{index} - Album: #{album.name}, Publish date: #{album.publish_date}, On Spotify: #{album.on_spotify}'
      end
    end
  end

  def save_files
    File.open('books.json', 'w') { |file| file.write(@books.to_json) }
    File.open('games.json', 'w') { |file| file.write(@games.to_json) }
    File.open('movies.json', 'w') { |file| file.write(@movies.to_json) }
    File.open('music_albums.json', 'w') { |file| file.write(@music_albums.to_json) }
    File.open('sources.json', 'w') { |file| file.write(@sources.to_json) }
    File.open('authors.json', 'w') { |file| file.write(@authors.to_json) }
    File.open('labels.json', 'w') { |file| file.write(@labels.to_json) }
    File.open('genres.json', 'w') { |file| file.write(@genres.to_json) }
  end

  def open_files
    open_books
    open_games
    open_movies
    open_music_albums
    open_sources
    open_authors
    open_labels
    open_genres
  end
end

require 'json'
require './game'
require './item'
require './author'
require_relative '../music_album'
require_relative '../genre'

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

  def display_games
    games.each do |game|
      puts "publish_date: #{game.publish_date} multiplayer: #{game.multiplayer} last_played_at: #{game.last_played_at}"
    end
  end

  def display_authors
    authors.each { |author| puts "first_name #{author.first_name} last_name: #{author.last_name}" }
  end

  def display_music_albums
    if @music_albums.length.zero?
      puts 'Sorry! There is no music album registered!'.upcase
    else
      puts 'List of all Music albums: \n'
      @music_albums.each_with_index do |_album, _index|
        puts "#{index} - Album: #{album.name}, Publish date: #{album.publish_date}, On Spotify: #{album.on_spotify}"
      end
    end
  end

  def display_genres
    puts
    if @genres.length.zero?
      puts 'Sorry! There is no music genre registered!'.upcase
    else
      puts "List of all genres: \n"
      @genres.each_with_index do |genre, index|
        puts "#{index} - Genre: #{genre.name}"
      end
    end
  end

  def create_game
    print 'publish_date:'
    publish_date = gets.chomp
    print 'multiplayer'
    multiplayer = gets.chomp
    print 'last_played_at'
    last_played_at = gets.chomp
    @games << Game.new(publish_date, multiplayer, last_played_at)
    puts 'Game Created'
  end

  def create_author
    print 'first_name:'
    first_name = gets.chomp
    print 'last_name'
    last_name = gets.chomp
    @authors << Author.new(first_name, last_name)
  end

  def create_music_album
    puts

    print 'Music album name: '
    music_name = gets.chomp

    print 'Published date: '
    publish_date = gets.chomp

    print 'On spotify? [Y/N]: '
    on_spotify = gets.chomp != 'n'

    music = MusicAlbum.new(publish_date: publish_date, name: music_name, archived: archived, on_spotify: on_spotify)
    genre = handle_genre
    genre.add_item(music)
    @music_albums << music
    @genre << genre unless @genre.include?(genre)

    puts
    puts 'Music album is created succussfully!'
    puts
  end

  def create_genre
    print 'Genre name: '
    genre = gets.chomp
    @genres << Genre.new(genre)
    puts 'Genre has been added successfully'
  end

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

  # rubocop:disable Style/GuardClause
  def open_games
    if File.exist?('games.json')
      JSON.parse(File.read('games.json')).map do |game|
        game_object = create_game_object(game)
        @games << game_object
      end
    end
  end

  def open_authors
    if File.exist?('authors.json')
      JSON.parse(File.read('authors.json')).map do |author|
        author_object = create_author_object(author)
        @authors << author_object
      end
    end
  end
  
  def open_genres
    if File.exist?('genres.json')
      JSON.parse(File.read('genre.json')).map do |genre|
        name = genre['name']
        new_genre = Genre.new(name)
        @genre << new_genre
      end
    else
      []
    end
  end

  def open_music_albums
    if File.exist?('music_albums.json')
      JSON.parse(File.read('music_albums.json')).map do |music|
        music_name = music['name']
        publish_date = music['publish_date']
        archived = music['archived'] || nil
        on_spotify = music['on_spotify']
        new_music = MusicAlbum.new(publish_date: publish_date, name: music_name, archived: archived,
                                   on_spotify: on_spotify)
        new_music.move_to_archive unless archived.nil?
        @music_albums << new_music
      end
    else
      []
    end
  end

  # rubocop:enable Style/GuardClause
  def create_game_object(game)
    new_object = Game.new(game['publish_date'], game['multiplayer'], game['last_played_at'])
    new_object.id = game['id'].to_i
    new_object
  end

  def create_author_object(author)
    new_object = Author.new(author['first_name'], author['last_name'])
    new_object.id = author['id'].to_i
    new_object
  end
end

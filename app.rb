class App
  def initialize
    @main = 0
    @book = []
    @music_album = []
    @movie = []
    @game = []
    @genre = []
    @source = []
    @label = []
    @author = []
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

  def save_files
    save_books
    save_games
    save_movies
    save_music_albums
    save_sources
    save_authors
    save_labels
    save_genres
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

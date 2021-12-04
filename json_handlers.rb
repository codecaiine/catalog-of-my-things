module JsonHandlers
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
  def open_books
    if File.exist?('books.json')
      JSON.parse(File.read('books.json')).map do |book|
        book_object = create_book_object(book)
        @books << book_object
      end
    end
  end

  def open_movies
    if File.exist?('movies.json')
      JSON.parse(File.read('movies.json')).map do |movie|
        movie_object = create_movie_object(movie)
        @movies << movie_object
      end
    end
  end

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

  def open_sources
    if File.exist?('sources.json')
      JSON.parse(File.read('sources.json')).map do |source|
        source_object = create_source_object(source)
        @sources << source_object
      end
    end
  end

  def open_labels
    if File.exist?('labels.json')
      JSON.parse(File.read('labels.json')).map do |label|
        label_object = create_label_object(label)
        @labels << label_object
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

  def create_book_object(book)
    new_object = Book.new(book['publish_date'], book['multiplayer'], book['last_played_at'])
    new_object.id = book['id'].to_i
    new_object
  end

  def create_movie_object(movie)
    new_object = Movie.new(movie['publish_date'], movie['silet'])
    new_object.id = movie['id'].to_i
    new_object
  end

  def create_source_object(source)
    new_object = Source.new(source['name'])
    new_object.id = movie['id'].to_i
    new_object
  end

  def create_label_object(label)
    new_object = Label.new(label['title'], label['color'])
    new_object.id = label['id'].to_i
    new_object
  end
end

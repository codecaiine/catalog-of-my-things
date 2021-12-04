module CreateItems
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

    print 'Published date: '
    publish_date = gets.chomp

    print 'On spotify? [Y/N]: '
    on_spotify = gets.chomp != 'n'

    music = MusicAlbum.new(publish_date, on_spotify)
    @music_albums << music

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

  def create_book
    print 'Published date: '
    publish_date = gets.chomp

    print 'Publisher name: '
    publisher = gets.chomp

    print 'Cover state: '
    cover_state = gets.chomp

    @books << Book.new(publish_date, publisher, cover_state)
    puts 'Book has been added successfully'
  end

  def create_movie
    print 'Published date: '
    publish_date = gets.chomp

    print 'Silet: '
    silet = gets.chomp

    @movies << Movie.new(publish_date, silet)
    puts 'Movie has been added successfully'
  end
end

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
end

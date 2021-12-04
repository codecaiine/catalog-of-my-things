module DisplayItems
  def display_games
    if @games.length.zero?
      puts 'Sorry! There is no games registered!'.upcase
    else
      puts 'List of all Games: \n'
      index = 0
      @games.each do |game|
        print "#{index} - Game: "
        print "publish_date: #{game.publish_date} "
        print "multiplayer: #{game.multiplayer} "
        puts "last_played_at: #{game.last_played_at} "
        index += 1
      end
    end
  end

  def display_music_albums
    if @music_albums.length.zero?
      puts 'Sorry! There is no music album registered!'.upcase
    else
      puts 'List of all Music albums: \n'
      index = 0
      @music_albums.each do |album|
        puts "#{index} - Album: Publish date: #{album.publish_date}, On Spotify: #{album.on_spotify}"
        index += 1
      end
    end
  end

  def display_movies
    if @movies.length.zero?
      puts 'Sorry! There is no movies registered!'.upcase
    else
      puts 'List of all Movies: \n'
      index = 0
      @movies.each do |movie|
        print "#{index} - movie: "
        print "publish_date: #{movie.publish_date} "
        puts "multiplayer: #{movie.silet} "
        index += 1
      end
    end
  end

  def display_books
    if @books.length.zero?
      puts 'Sorry! There is no book registered!'.upcase
    else
      puts 'List of all Books: \n'
      index = 0
      @books.each do |book|
        print "#{index} - book: "
        print "publish_date: #{book.publish_date} "
        print "publisher: #{book.publisher} "
        puts "cover_state: #{book.cover_state} "
        index += 1
      end
    end
  end
end

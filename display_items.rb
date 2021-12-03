module DisplayItems
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
end

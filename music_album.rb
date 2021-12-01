require_relative './item.rb'

class MusicAlbum < item
  def intialize(publish_date, on_spotify: false, archived)
    super(publish_date, archived)
    @on_spotify = on_spotify
end
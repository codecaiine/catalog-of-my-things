require_relative './item.rb'

class MusicAlbum < item
  attr_accessor :publish_date, :on_spotify
  attr_reader :archived

  def intialize(publish_date, on_spotify: false, archived)
    super(publish_date, archived)
    @on_spotify = on_spotify
end
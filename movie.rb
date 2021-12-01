require_relative './item'

class MusicAlbum < item
  attr_accessor :publish_date, :on_spotify
  attr_reader :archived
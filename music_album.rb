require_relative './item'

class MusicAlbum < item
  attr_accessor :publish_date, :on_spotify, :archived

  def intialize(publish_date:, archived: false, on_spotify: true)
    super(publish_date: publish_date, archived: archived)
    @on_spotify = on_spotify
  end
  
  private

  def can_be_archived?
    super && on_spotify
  end
end

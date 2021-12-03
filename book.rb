require_relative 'item'

class Book < Item
  def initialize(publisher, publish_date)
    super(publish_date)
    @publisher = publisher
  end
end
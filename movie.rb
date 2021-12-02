require_relative './item'

class Movie < Item
  
  attr_accessor :silet

  def initialize(publish_date, silet)
    super(publish_date)
    @silet = silet
  end

  private
  def can_be_archived?
    super() || @silet
  end
end

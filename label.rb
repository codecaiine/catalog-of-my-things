require_relative 'item'

class Label
  attr_accessor :title, :color, :items

  def initialize(title, color)
    @title = title
    @color = color
    @items = []
  end
end
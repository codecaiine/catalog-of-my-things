class Genre
  attr_accessor :name

  def initialize(name)
    @id = Random.rand(1..1000)
    @name = name
    @items = []
  end

  def add_item(item)
    @items.push(item) unless @items.include?(item)
    item.add_genre(self)
  end

  def show_items
    @items
  end
end

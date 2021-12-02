class Item
  attr_reader :genre, :author, :label, :source

  def initialize(publish_date, id = Random.rand(1..10_000), archived: false)
    @id = id
    @publish_date = publish_date
    @archived = archived
  end

  def add_genre(genre)
    @genre = genre
    genre.items << self unless genre.items.include?(self)
  end

  def add_author(author)
    @author = author
    author.items << self unless author.items.include?(self)
  end

  def add_source(source)
    @source = source
    source.items << self unless source.items.include?(self)
  end

  def add_label(label)
    @label = label
    label.items << self unless label.items.include?(self)
  end

  def can_be_archived?
    @publish_date.to_i > 10
  end

  def move_to_archive?
    @archived = can_be_archived?
  end
end
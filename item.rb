require 'date'

class Item
  DEFAULT_BOOL = false

  attr_accessor :archived, :publish_date

  def initialize(_genre, author, label, publish_date, archived = DEFAULT_BOOL)
    @id = Random.rand(1..1000)
    @author = author
    @label = label
    @publish_date = publish_date
    @archived = archived
  end

  def can_be_archived?
    d = Date.today
    d > publish_date.next_year(10)
  end

  def move_to_archive
    @archived = can_be_archived?
  end
end

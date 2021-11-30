require "date"

class Item
  attr_accessor :archived, :publish_date
  
  
    def initialize(genre, author, label, publish_date, archived = false)
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

class Source
    attr_reader :items, :name

    def initialize(name, id = Random.rand(1..100))
        @id = id
        @name = name
        @items = []
    end

    def add_item(item)
    end
end
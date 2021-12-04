require_relative '../item'
require_relative '../author'

describe Author do
  context 'Testing Author Class' do
    before(:all) do
      @new_author = Author.new('Ahmad', 'Mahmmod')
      @new_item = Item.new('2020-10-10')
    end
    
    it 'new_author is an instance of Author' do
        expect(@new_author).to be_instance_of(Author)
    end

end

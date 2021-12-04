require_relative '../item'
require_relative '../author'

describe Author do
  context 'Testing Author Class' do
    before(:all) do
      @new_author = Author.new('Ahmad', 'Mahmmod')
      @new_item = Item.new('2020-10-10')
    end

    
end

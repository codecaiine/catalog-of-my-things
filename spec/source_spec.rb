require_relative '../source'
require_relative '../item'

describe Source do
  context 'Creating a source' do
    it 'Requires one parameter, name' do
      source = Source.new('My friend')
      expect(source).to be_instance_of Source
    end

    it 'Accept parameter ID as well' do
      source = Source.new('My friend', 1)
      expect(source).to be_instance_of Source
    end
  end

  context 'Using add_item method from Source' do
    before(:each) do
      @source = Source.new('My friend')
      @item = Item.new(15)
    end

    it 'Fails if the parameter is not an Item instance' do
      expect(@source.add_item(1)).to eq 'Please insert a proper item here'
    end

    it 'Add an item to its item list if an item instance is passed' do
      @source.add_item(@item)
      expect(@source.items[0]).to be @item
    end

    it 'Add itself to the item source if an item instance is passed' do
      @source.add_item(@item)
      expect(@item.source).to be @source
    end
  end
end

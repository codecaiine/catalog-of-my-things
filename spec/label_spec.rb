require_relative '../label'
require_relative '../item'

describe Label do
  title = 'Title'
  color = 'red'
  let(:label) { Label.new(title, color) }
  let(:item) { Item.new(11, 100) }

  it 'should have a title' do
    expect(label.title).to eq(title)
  end

  it 'should have a color' do
    expect(label.color).to eq(color)
  end

  it 'return an object' do
    expect(label).to be_an_instance_of(Label)
  end

  it 'Test add_item method' do
    label.add_item(item)
    expect(label.items[0]).to eq(item)
  end
end

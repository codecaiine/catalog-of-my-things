require_relative '../book'

describe Book do
  publisher = 'Iron Man'
  cover_state = 'good'
  publish_date = 10
  let(:book) { Book.new(publisher, cover_state, publish_date) }

  it 'instance of Book' do
    expect(book).to be_an_instance_of(Book)
  end

  it 'return publisher of the book object' do
    expect(book.publisher).to eq(publisher)
  end

  it 'return cover_state of the book object' do
    expect(book.cover_state).to eq(cover_state)
  end

  it 'can_be_archived? test' do
    expect(book.can_be_archived?).to eq(true)
  end
end

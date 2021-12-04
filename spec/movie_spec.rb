require_relative '../movie'
require_relative '../item'
describe Movie do
  context 'Testing Game Class:' do
    before(:all) do
      @new_movie = Movie.new('2010-2-2', 'yes', '2021-10-10')
    end
    it 'The new_movie object is an instance of Movie' do
        expect(@new_movie).to be_instance_of Movie
    end
    it 'The new_movie object is an instance of (Inherted from) Item' do
        expect(@new_movie).to be_kind_of Item
    end
    

require_relative '../movie'

describe Movie do
  context 'Creating a movie' do
    it 'Expects user to pass publish_date and silent as parameters' do
      movie = Movie.new(15, silent: false)
      expect(movie).to be_an_instance_of Movie
    end

    it 'Throw an error if the right arguments are not passed' do
      expect { Movie.new }.to raise_error(ArgumentError)
    end
  end

  context 'Using Movie can_be_archived? method' do
    it 'Returns true if super returns true, so if publish_date > 10 years' do
      movie = Movie.new(15, silent: false)
      expect(movie.can_be_archived?).to be true
    end

    it 'Returns true if the movie is silent' do
      movie = Movie.new(10, silent: true)
      expect(movie.can_be_archived?).to be true
    end

    it 'Returns false if super returns false or if the movie is not silent' do
      movie = Movie.new(10, silent: false)
      expect(movie.can_be_archived?).to be false
    end
  end
end

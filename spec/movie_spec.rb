require_relative '../movie'
require_relative '../item'
describe Game do
  context 'Testing Game Class:' do
    before(:all) do
      @new_game = Game.new('2010-2-2', 'yes', '2021-10-10')
    end
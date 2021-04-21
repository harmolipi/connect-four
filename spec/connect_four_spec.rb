# frozen_string_literal: true

# rubocop: disable Metrics/BlockLength

require_relative '../lib/connect_four'
require_relative '../lib/player'
require_relative '../lib/colors'

describe ConnectFour do
  let(:player_one) {  instance_double('player', to_s: " \u26AB".red) }
  let(:player_two) {  instance_double('player', to_s: " \u26AB".yellow) }
  subject(:my_game) { described_class.new(player_one, player_two) }


  describe '#drop_piece' do

  end

  describe '#valid_move?' do
    context 'when player enters a letter' do
      it 'returns false' do
        input = 'a'
        expect(my_game).not_to be_valid_move(input)
      end
    end

    context 'when player enters an invalid number' do
      it 'returns false' do
        input = '8'
        expect(my_game).not_to be_valid_move(input)
      end
    end

    context 'when player enters a 2-digit number' do
      it 'returns false' do
        input = '22'
        expect(my_game).not_to be_valid_move(input)
      end
    end

    context 'when player picks a full column' do
      it 'returns false' do
        my_game.instance_variable_set(:@board, [[], [player_one, player_one, player_one, player_one, player_one, player_one], [], [], [], [], []])
        input = '1'
        expect(my_game).not_to be_valid_move(input)
      end
    end

    context 'when player makes a valid move' do
      it 'returns true' do
        input = '2'
        expect(my_game).to be_valid_move(input)
      end
    end
  end

  describe '#won?' do

  end
end

# rubocop: enable Metrics/BlockLength

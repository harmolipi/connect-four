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
    context 'when Player 1 chooses column 2' do
      it "adds Player 1's piece to the corresponding array" do
        game_board = my_game.instance_variable_get(:@board)
        my_game.drop_piece('2')
        expect(game_board[1][0]).to eql(player_one)
      end
    end

    context 'when Player 1 chooses column 2 twice' do
      it 'adds two Player 1 pieces to the corresponding array' do
        game_board = my_game.instance_variable_get(:@board)
        my_game.drop_piece('2')
        my_game.drop_piece('2')
        expect(game_board[1]).to contain_exactly(player_one, player_one)
      end
    end

    context 'when Player 1 chooses column 6' do
      it "adds Player 1's piece to the corresponding array" do
        game_board = my_game.instance_variable_get(:@board)
        # expect { my_game.drop_piece('6') }.to change(game_board[5], :length).by(1)
        my_game.drop_piece('6')
        expect(game_board[5][0]).to eql(player_one)
      end
    end

    context 'when Player 1 and Player 2 both choose column 5' do
      it "Adds both Player 1's and Player 2's pieces to the corresponding array" do
        game_board = my_game.instance_variable_get(:@board)
        my_game.drop_piece('5')
        my_game.instance_variable_set(:@current_player, player_two)
        my_game.drop_piece('5')
        expect(game_board[4]).to include(player_one, player_two)
      end
    end
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

    context 'when no player has connected 4' do
      it 'returns false' do
        expect(my_game).not_to be_won
      end
    end

    context 'when player connects 4 horizontally on the bottom row' do
      it 'returns true' do
        expect(my_game).to be_won
      end
    end

    context 'when player connects 4 vertically on the second column' do
      it 'returns true' do
        expect(my_game).to be_won
      end
    end

    context 'when player connects  4 diagonally from the bottom of column 1'
  end
end

# rubocop: enable Metrics/BlockLength

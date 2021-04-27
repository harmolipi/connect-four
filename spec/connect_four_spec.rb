# frozen_string_literal: true

# rubocop: disable Metrics/BlockLength

require_relative '../lib/connect_four'
require_relative '../lib/player'
require_relative '../lib/board'
require_relative '../lib/colors'

describe ConnectFour do
  let(:player_one) { instance_double('player', to_s: " \u26AB".red, player_number: 1) }
  let(:player_two) { instance_double('player', to_s: " \u26AB".yellow, player_number: 2) }
  let(:game_board) { instance_double('board', player_one: player_one, player_two: player_two) }
  subject(:my_game) { described_class.new(game_board) }

  describe '#game_over?' do
    context 'when no player has connected 4' do
      it 'returns false' do
        allow(my_game).to receive(:horizontal_win?).and_return(false)
        allow(my_game).to receive(:vertical_win?).and_return(false)
        allow(my_game).to receive(:diagonal_forwards_win?).and_return(false)
        allow(my_game).to receive(:diagonal_backwards_win?).and_return(false)
        expect(my_game).not_to be_game_over
      end
    end
  end

  describe '#horizontal_win?' do
    context 'when player connects 4 from column 1, row 1' do
      it 'returns true' do
        contents = [[player_one], [player_one], [player_one], [player_one], [], [], []]
        allow(game_board).to receive(:board_contents).and_return(contents)
        expect(subject).to be_horizontal_win
      end
    end

    context 'when player connects 4 from column 2, row 1' do
      it 'returns true' do
        contents = [[], [player_one], [player_one], [player_one], [player_one], [], []]
        allow(game_board).to receive(:board_contents).and_return(contents)
        expect(subject).to be_horizontal_win
      end
    end

    context 'when player connects 4 from column 3, row 1' do
      it 'returns true' do
        contents = [[], [], [player_one], [player_one], [player_one], [player_one], []]
        allow(game_board).to receive(:board_contents).and_return(contents)
        expect(subject).to be_horizontal_win
      end
    end

    context 'when player connects 4 from column 4, row 1' do
      it 'returns true' do
        contents = [[], [], [], [player_one], [player_one], [player_one], [player_one]]
        allow(game_board).to receive(:board_contents).and_return(contents)
        expect(subject).to be_horizontal_win
      end
    end
  end

  describe '#vertical_win?' do
    context 'when player connects 4 vertically from column 2, row 1' do
      it 'returns true' do
        contents = [[], [player_one, player_one, player_one, player_one], [], [], [], [], []]
        allow(game_board).to receive(:board_contents).and_return(contents)
        expect(my_game).to be_vertical_win
      end
    end

    context 'when player connects 4 vertically from column 2, row 2' do
      it 'returns true' do
        contents = [[], [player_two, player_one, player_one, player_one, player_one], [], [], [], [], []]
        allow(game_board).to receive(:board_contents).and_return(contents)
        expect(my_game).to be_vertical_win
      end
    end

    context 'when player connects 4 vertically from column 2, row 3' do
      it 'returns true' do
        contents = [[], [player_two, player_two, player_one, player_one, player_one, player_one], [], [], [], [], []]
        allow(game_board).to receive(:board_contents).and_return(contents)
        expect(my_game).to be_vertical_win
      end
    end
  end

  describe '#diagonal_forwards_win?' do
    context 'when player connects 4 diagonally forwards column 1, row 1' do
      it 'returns true' do
        contents = [[player_one], [player_two, player_one], [player_one, player_two, player_one], [player_two, player_one, player_two, player_one], [], [], []]
        allow(game_board).to receive(:board_contents).and_return(contents)
        expect(my_game).to be_diagonal_forwards_win
      end
    end
  end

  describe '#diagonal_backwards_win?' do
    context 'when player connects 4 diagonally backwards from column 7, row 1' do
      it 'returns true' do
        contents = [[], [], [], [player_two, player_one, player_two, player_one], [player_one, player_two, player_one], [player_two, player_one], [player_one]]
        allow(game_board).to receive(:board_contents).and_return(contents)
        expect(my_game).to be_diagonal_backwards_win
      end
    end
  end

  describe '#ending' do
    before(:each) do
      allow(game_board).to receive(:to_s)
      allow(my_game).to receive(:puts)
    end

    context 'when there is no winner' do
      it 'prints the tie message' do
        my_game.instance_variable_set(:@winner, nil)
        expect(my_game).to receive(:puts).with('Looks like it was a tie!')
        my_game.ending
      end
    end

    context 'when Player 1 is the winner' do
      it 'congratulates Player 1' do
        my_game.instance_variable_set(:@winner, player_one)
        expect(my_game).to receive(:puts).with("Congrats Player 1, you win!\n\n")
        my_game.ending
      end
    end

    context 'when Player 2 is the winner' do
      it 'congratulates Player 2' do
        my_game.instance_variable_set(:@winner, player_two)
        expect(my_game).to receive(:puts).with("Congrats Player 2, you win!\n\n")
        my_game.ending
      end
    end
  end
end

# rubocop: enable Metrics/BlockLength

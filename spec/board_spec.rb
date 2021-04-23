# frozen_string_literal: true

# rubocop: disable Metrics/BlockLength

require_relative '../lib/board'

describe Board do
  let(:player_one) {  instance_double('player', to_s: " \u26AB".red) }
  let(:player_two) {  instance_double('player', to_s: " \u26AB".yellow) }
  full_column = [player_one, player_two, player_one, player_two, player_one, player_two, player_one, player_two]
  half_column = [player_one, player_two, player_one, player_two]
  partially_filled = [full_column, half_column, full_column, half_column, full_column, half_column]
  # subject(:empty_board) { described_class.new(player_one, player_two) }
  # subject(:partially_filled_board) { described_class.new(player_one, player_two, partially_filled) }

  describe '#drop_piece' do
    context 'when Player 1 chooses column 2' do
      
    end
  end
end

# rubocop: enable Metrics/BlockLength

# frozen_string_literal: true

# rubocop: disable Metrics/BlockLength

require_relative '../lib/board'

describe Board do
  let(:player_one) {  instance_double('player', to_s: " \u26AB".red) }
  let(:player_two) {  instance_double('player', to_s: " \u26AB".yellow) }
  subject(:empty_board) { described_class.new(player_one, player_two) }
  # subject(:partially_filled_board) { described_class.new(player_one, player_two, partially_filled) }

  describe '#drop_piece' do
    before do
      full_column = [player_one, player_two, player_one, player_two, player_one, player_two, player_one, player_two]
      half_column = [player_one, player_two, player_one, player_two]
      partially_filled = [full_column, half_column, full_column, half_column, full_column, half_column]
      allow(subject).to receive(:valid_move?).and_return(true)
    end

    context 'valid_move? is true' do
      context 'empty board' do
        context 'when Player 1 drops a piece in column 2' do
          it "column 2 includes only Player 1's piece" do
            board_contents = subject.instance_variable_get(:@board_contents)
            subject.drop_piece('2', player_one)
            expect(board_contents[1]).to eql([player_one])
          end
        end
        context 'when player 2 drops an additional piece in column 2' do
          it "column 2 includes Player 1's and Player 2's pieces in order" do
            board_contents = subject.instance_variable_get(:@board_contents)
            subject.drop_piece('2', player_one)
            subject.drop_piece('2', player_two)
            expect(board_contents[1]).to eql([player_one, player_two])
          end
        end
      end

      context 'valid_move? is false' do
        before do
          allow(subject).to receive(:valid_move?).and_return(false)
        end

        context "Player 1 inputs 'a'" do
          it 'raises a StandardError' do
            allow(subject).to receive(:valid_move?).and_return(false)
            expect { subject.drop_piece('a', player_one) }.to raise_error(StandardError)
          end
        end
      end
    end
  end
end

# rubocop: enable Metrics/BlockLength

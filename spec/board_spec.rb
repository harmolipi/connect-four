# frozen_string_literal: true

# rubocop: disable Metrics/BlockLength

require_relative '../lib/board'
require_relative '../lib/player'
require_relative '../lib/colors'

describe Board do
  let(:player_one) {  instance_double('player', to_s: " \u26AB".red) }
  let(:player_two) {  instance_double('player', to_s: " \u26AB".yellow) }
  subject(:empty_board) { described_class.new(player_one, player_two) }

  describe '#drop_piece' do
    context 'valid_move? is true' do
      before do
        allow(subject).to receive(:valid_move?).and_return(true)
      end

      context 'empty board' do
        context 'when Player 1 drops a piece in column 2' do
          it "column 2 includes only Player 1's piece" do
            subject.drop_piece('2', player_one)
            expect(subject.board_contents[1]).to eql([player_one])
          end
        end

        context 'when player 2 drops an additional piece in column 2' do
          it "column 2 includes Player 1's and Player 2's pieces in order" do
            subject.drop_piece('2', player_one)
            subject.drop_piece('2', player_two)
            expect(subject.board_contents[1]).to eql([player_one, player_two])
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

  describe '#valid_move?' do
    subject(:partially_filled_board) { described_class.new(player_one, player_two, [[player_one, player_two, player_one,
                                                                                     player_two, player_one, player_two],
                                                                                     [], [], [], [], []]) }

    context "entering an empty column's number" do
      it 'returns true' do
        expect(subject).to be_valid_move('2')
      end
    end

    context "entering a full column's number" do
      it 'returns false' do
        expect(subject).not_to be_valid_move('1')
      end
    end

    context 'entering a non-number' do
      it 'returns false' do
        expect(subject).not_to be_valid_move('a')
      end
    end

    context 'entering a number outside 1-7' do
      it 'returns false' do
        expect(subject).not_to be_valid_move('8')
      end
    end

    context 'entering a 2-digit number' do
      it 'returns false' do
        expect(subject).not_to be_valid_move('22')
      end
    end
  end
end

# rubocop: enable Metrics/BlockLength

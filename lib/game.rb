# frozen_string_literal: true

require_relative './connect_four'
require_relative './board'
require_relative './player'

my_game = ConnectFour.new
# my_game.play
my_board = Board.new
# puts my_board
# my_board.drop_piece('2')
# puts my_board

# my_board.make_move('8')
# puts my_board.to_s

my_game.input_test
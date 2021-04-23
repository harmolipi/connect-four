# frozen_string_literal: true

require_relative './player'
# require_relative './colors'
require 'pry'

# Class handling Connect Four gameplay mechanics
class ConnectFour
  def initialize(board = Board.new)
    @board = board
    @current_player = @board.player_one
  end

  def play
    intro_text
    print_board
    # game_loop
  end

  def intro_text
    puts <<~intro
Let's play Connect Four!

Simply take turns entering the number of the column you'd like to drop a piece into.
You win when you manage to fill 4 spaces with your pieces, either horizontally,
vertically, or diagonally!

    intro
  end

  def game_loop
    until game_over?

    end
  end

  def request_input
    print_board
    print 'Choose a column: '
  end

  def input_test
    puts @board.to_s
    print 'Choose a column: '
    input = gets.chomp
    @board.drop_piece(input)
  rescue StandardError
    puts 'Invalid input, please try again.'
    retry
  end

  def player_input
    loop do
      user_input = gets.chomp
      return user_input if valid_move?(user_input)

      input_error
    end
  end

  def input_error
    puts 'That was an invalid move!'
    request_input
  end

  def game_over?

  end

  def won?

  end
end

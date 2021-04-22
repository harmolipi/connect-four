# frozen_string_literal: true

require_relative './player'
require_relative './colors'
require 'pry'

# Class handling Connect Four gameplay mechanisms
class ConnectFour
  PLAYER_ONE_COLOR = 'red'
  PLAYER_TWO_COLOR = 'yellow'
  EMPTY_CELL = "\u26AA"

  def initialize(player_one = Player.new(1, PLAYER_ONE_COLOR), player_two = Player.new(2, PLAYER_TWO_COLOR))
    @player_one = player_one
    @player_two = player_two
    @current_player = @player_one
    @board = Array.new(7) { [] }
  end

  def play
    intro_text
    print_board
    # game_loop
  end

  def intro_text
    puts <<-intro

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

  def print_board
    5.downto(0) do |i|
      print '    |'
      @board.each do |column|
        print column[i] || " #{EMPTY_CELL}"
        print '|'
      end
      puts "\n"
    end
    puts '      1   2   3   4   5   6   7'.green
  end

  def drop_piece(column)
    @board[column.to_i - 1] << @current_player
  end

  def request_input
    print_board
    print 'Choose a column: '
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

  def valid_move?(move)
    move =~ /^(?!0|8|9)\d$/ && @board[move.to_i].length < 6
  end

  def game_over?

  end

  def won?

  end
end

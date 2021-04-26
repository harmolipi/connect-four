# frozen_string_literal: true

require_relative './player'
require 'pry'

# Game board for ConnectFour
class Board
  PLAYER_ONE_COLOR = 'red'
  PLAYER_TWO_COLOR = 'yellow'
  EMPTY_CELL = "\u26AA"

  # attr_reader :player_one, :player_two, :board_contents

  def initialize(player_one = Player.new(1, PLAYER_ONE_COLOR), player_two = Player.new(2, PLAYER_TWO_COLOR),
                 board_contents = Array.new(7) { [] })
    @board_contents = board_contents
    @player_one = player_one
    @player_two = player_two
  end

  def to_s
    5.downto(0) do |i|
      print '    |'
      @board_contents.each do |column|
        print column[i] || " #{EMPTY_CELL}"
        print '|'
      end
      puts "\n"
    end
    puts '      1   2   3   4   5   6   7'.green
  end

  def drop_piece(column, player)
    valid_move?(column) ? @board_contents[column.to_i - 1] << player : raise { StandardError 'Invalid input' }
  end

  def valid_move?(column)
    column =~ /^(?!0|8|9)\d$/ && @board_contents[column.to_i].length < 6
  end
end

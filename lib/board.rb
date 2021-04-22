# frozen_string_literal: true

require_relative './player'
require 'pry'

# Game board for ConnectFour
class Board
  PLAYER_ONE_COLOR = 'red'
  PLAYER_TWO_COLOR = 'yellow'
  EMPTY_CELL = "\u26AA"

  def initialize(contents = Array.new(7) { [] }, player_one = Player.new(1, PLAYER_ONE_COLOR),
                 player_two = Player.new(2, PLAYER_TWO_COLOR))
    @contents = contents
    @player_one = player_one
    @player_two = player_two
  end
end

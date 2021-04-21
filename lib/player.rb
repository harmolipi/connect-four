# frozen_string_literal: true

require_relative './colors'

# Class for the Connect Four players
class Player
  attr_reader :player_number, :player_symbol

  def initialize(player_number, player_color)
    @player_number = player_number
    @player_symbol = " \u26AB".send(player_color)
  end

  def to_s
    @player_symbol
  end
end

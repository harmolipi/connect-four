# frozen_string_literal: true

require_relative './player'
require_relative './board'
require_relative './colors'

# Class handling Connect Four gameplay mechanics
class ConnectFour
  def initialize(board = Board.new)
    @board = board
    @current_player = @board.player_one
    @winner = nil
  end

  def play
    intro_text
    game_loop
    ending
  end

  def intro_text
    puts <<~INTRO

      Let's play Connect Four!

      Simply take turns entering the number of the column you'd like to drop a piece into.
      You win when you manage to fill 4 consecutive spaces with your pieces, either horizontally,
      vertically, or diagonally!

    INTRO
  end

  private

  def game_loop
    42.times do
      input
      break if game_over?

      @current_player = @current_player == @board.player_one ? @board.player_two : @board.player_one
    end
  end

  def input
    puts @board.to_s
    print "Choose a column, Player #{@current_player.player_number}: "
    input = gets.chomp
    @board.drop_piece(input, @current_player)
  rescue StandardError
    puts "\nInvalid input, please try again.".red
    retry
  end

  def game_over?
    if horizontal_win? || vertical_win? || diagonal_forwards_win? || diagonal_backwards_win?
      @winner = @current_player
      true
    else
      false
    end
  end

  def horizontal_win?
    (0..3).each do |column|
      (0..5).each do |row|
        3.times do |counter|
          break unless !@board.board_contents[column + counter][row].nil? && @board.board_contents[column + counter][row] == @board.board_contents[column + counter + 1][row]

          return true if counter == 2
        end
      end
    end
    false
  end

  def vertical_win?
    (0..6).each do |column|
      (0..2).each do |row|
        3.times do |counter|
          break unless !@board.board_contents[column][row + counter].nil? && @board.board_contents[column][row + counter] == @board.board_contents[column][row + counter + 1]

          return true if counter == 2
        end
      end
    end
    false
  end

  def diagonal_forwards_win?
    (0..3).each do |column|
      (0..2).each do |row|
        3.times do |counter|
          break unless !@board.board_contents[column + counter][row + counter].nil? && @board.board_contents[column + counter][row + counter] == @board.board_contents[column + counter + 1][row + counter + 1]

          return true if counter == 2
        end
      end
    end
    false
  end

  def diagonal_backwards_win?
    (0..3).each do |column|
      (3..5).each do |row|
        3.times do |counter|
          break unless !@board.board_contents[column + counter][row - counter].nil? && @board.board_contents[column + counter][row - counter] == @board.board_contents[column + counter + 1][row - counter - 1]

          return true if counter == 2
        end
      end
    end
    false
  end

  def ending
    puts "#{@board.to_s}"
    puts @winner.nil? ? 'Looks like it was a tie!' : "Congrats Player #{@winner.player_number}, you win!\n\n"
  end
end

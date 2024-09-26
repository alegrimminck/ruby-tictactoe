# frozen_string_literal: true

require_relative 'board'
require_relative 'player'
require_relative 'display'

class Game
  include Display

  def initialize
    @current_player = nil
    @board = Board.new
    @player_one = nil
    @player_two = nil
  end

  def start
    initial_setup
    @board.show
    take_turns
    conclusion
  end

  private

  def initial_setup
    @player_one = create_player(1)
    @player_two = create_player(2, @player_one.marker)
    @current_player = @player_one
  end

  def create_player(id, possible_duplicate = nil)
    Display.creating_player_text(id)
    name = gets.chomp
    while true
      Display.ask_for_marker
      marker = gets.chomp
      break if marker != possible_duplicate

      Display.marker_in_use(marker)
    end

    Player.new(name, marker)
  end

  def take_turns
    until @board.full?
      input = turn_input
      @board.update(@current_player.marker, input)
      @board.show

      break if @board.game_over?

      @current_player = switch_player
    end
  end

  def turn_input
    Display.enter_mark_option
    player_input = gets.chomp.to_i

    return player_input if @board.valid_move?(player_input)

    Display.invalid_move
    turn_input
  end

  def switch_player
    @current_player = @current_player == @player_one ? @player_two : @player_one
  end

  def conclusion
    if @board.game_over?
      Display.player_wins(@current_player.name, @current_player.marker)
    else
      Display.tied_game
    end
  end
end

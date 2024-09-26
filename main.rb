# frozen_string_literal: true

require_relative 'lib/game'

def play
  game = Game.new
  game.start
  replay
end

def replay
  p 'Do you want to play again? (y/n): '

  user_input = gets.chomp
  play if user_input == 'y'
end

play

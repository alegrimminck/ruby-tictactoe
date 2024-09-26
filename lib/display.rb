module Display
  def self.creating_player_text(id)
    puts "Creating player #{id}, can you give me his name?"
  end

  def self.ask_for_marker
    puts 'Could you also give me his marker?'
  end

  def self.marker_in_use(marker)
    puts "Sorry but #{marker} is already in use"
  end

  def self.enter_mark_option
    puts 'Enter the square you want to mark: '
  end

  def self.invalid_move
    puts 'You must choose a remaining number, try again...'
  end

  def self.player_wins(name, marker)
    puts "Player #{name} (#{marker}) wins!"
  end

  def self.tied_game
    puts 'The game was a tie!'
  end
end

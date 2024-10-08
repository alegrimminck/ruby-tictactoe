# frozen_string_literal: true

class Player
  attr_reader :marker, :name

  def initialize(name, marker = nil)
    @name = name
    @marker = marker
  end
end

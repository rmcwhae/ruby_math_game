class Player
  attr_accessor :lives
  attr_reader :id
  def initialize(id)
    @player_id = id
    @lives = 3
  end
end

class Turn

  def initialize(id)
    @my_turn = id
    puts "Player #{id}: What does stuff mean?"
  end

end

class Game

end

player_one = Player.new(1)
player_two = Player.new(2)

puts Turn.new(2)
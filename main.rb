# frozen_string_literal: true

class Player
  attr_accessor :lives
  attr_reader :id
  def initialize(id)
    @id = id
    @lives = 3
  end
end

# class Turn

# end

class Game
  def initialize
    @player_one = Player.new(1)
    @player_two = Player.new(2)
    @current_player = @player_one
    # puts Turn.new(@current_player)
  end

  def turn(player)
    x = rand(20)
    y = rand(20)
    puts "Player #{player.id}: What does #{x} plus #{y} equal?"
    answer = gets.chomp.to_i
    if answer == (x + y)
      puts "Player #{player.id}: YES! You are correct."
    elsif answer != x + y
      puts "Player #{player.id}: Seriously? No!"
      player.lives -= 1
    end
    puts "P1: #{@player_one.lives}/3 vs P2: #{@player_two.lives}/3"
  end

  def play()
    turn(@player_one)
  end

end


new_game = Game.new
new_game.play
# puts new_game.turn(2)

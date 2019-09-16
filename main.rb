# frozen_string_literal: true

class Player
  attr_accessor :lives
  attr_reader :id
  def initialize(id)
    @player_id = id
    @lives = 3
  end
end

class Turn
  def initialize(player_id)
    x = rand(20)
    y = rand(20)
    puts "Player #{player_id}: What does #{x} plus #{y} equal?"
    answer = gets.chomp.to_i
    puts answer.inspect
    if answer == (x + y)
      puts "Player #{player_id}: YES! You are correct."
    elsif answer != x + y
      puts "Player #{player_id}: Seriously? No!"
      # REDUCE LIVES HERES
    end
  end
end

class Game
  def initialize
    puts Turn.new(1)
  end
end

player_one = Player.new(1)
player_two = Player.new(2)

puts Turn.new(2)

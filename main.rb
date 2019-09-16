class Player
  attr_accessor :lives
  attr_reader :id
  def initialize(id)
    @id = id
    @lives = 3
  end
end

class Game
  def initialize
    @player_one = Player.new(1)
    @player_two = Player.new(2)
    @current_player = @player_one
  end

  def turn(player)
    x = rand(20)
    y = rand(20)
    puts '----- NEW TURN -----'
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

  def end_game(player)
    puts '----- GAME OVER -----'
    puts "Player #{player.id} wins with a score of #{player.lives}/3"
  end

  def play
    while @player_one.lives > 0 || @player_two.lives > 0
      if @player_one.lives == 0
        end_game(@player_two)
        exit
      elsif @player_two.lives == 0
        end_game(@player_one)
        exit
      end
      if @current_player == @player_one
        turn(@player_one)
        @current_player = @player_two
      elsif @current_player == @player_two
        turn(@player_two)
        @current_player = @player_one
      end
    end
  end
end

# Action time!
new_game = Game.new
new_game.play

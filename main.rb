# frozen_string_literal: true

require './player'

locale = :en

ALL_LANGUAGES = {
  en: {
    new_turn: '----- NEW TURN -----'
  },
  fr: {
    new_turn: '----- NOUVEAU TOUR -----'
  }
}.freeze

MESSAGES = ALL_LANGUAGES[locale]

class Display
  def self.say(msg)
    puts msg
  end
end

class Game
  def initialize(p1, p2)
    @player_one = p1
    @player_two = p2
    @current_player = @player_one
  end

  def turn(player)
    x = rand(20)
    y = rand(20)
    right_msgs = ['Nailed it!',
                  'Mmmmmm hmmmmmmmm.',
                  'YES! You are correct.']
    wrong_msgs = ['Seriously? No!',
                  'Are you for real? Do you even math, bro?',
                  'Terrible.']
    Display.say MESSAGES[:new_turn] # borrowed from Hafiz: https://gist.github.com/hafbau/11a84e3c7b725e21b873953364ea8ee0
    puts "Player #{player.id}: What does #{x} plus #{y} equal?"
    answer = gets.chomp.to_i
    if answer == (x + y)
      puts "Player #{player.id}: #{right_msgs.sample}"
    elsif answer != x + y
      puts "Player #{player.id}: #{wrong_msgs.sample}"
      player.lives -= 1
    end
    puts "P1: #{@player_one.lives}/3 vs P2: #{@player_two.lives}/3"
  end

  def end_game
    player =  @player_one.lives.zero? ? @player_two : @player_one
    puts '----- GAME OVER -----'
    puts "Player #{player.id} wins with a score of #{player.lives}/3"
  end

  def play
    while @player_one.lives.positive? && @player_two.lives.positive?
      if @current_player == @player_one
        turn(@player_one)
        @current_player = @player_two
      else
        turn(@player_two)
        @current_player = @player_one
      end
    end
    end_game
  end
end

# Action time!
player_one = Player.new(1)
player_two = Player.new(2)
new_game = Game.new(player_one, player_two)
new_game.play

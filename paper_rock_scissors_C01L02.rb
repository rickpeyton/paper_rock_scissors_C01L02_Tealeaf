# Object Oriented Paper Rock Scissors
# Tealeaf Academy C01L02
require 'pry'

class RockPaperScissors
  attr_accessor :player, :computer

  def initialize
    to_s
    @player = Player.new
    @computer = Player.new
    play
  end

  def to_s
    puts 'Play Rock Paper Scissors!'
  end

  def play
    begin
      begin
        puts 'Choose one: (P/R/S)'
        choice = gets.chomp.upcase
      end until Plays::CHOICES.keys.include?(choice)
      self.player.choice = choice
      self.computer.choice = Plays::CHOICES.keys.sample
      puts "Player plays #{player.translate} and Computer plays " \
        "#{computer.translate}"
      pick_winner
      puts 'Do you want to play again? (Y/N)'
      play_again = gets.chomp.upcase
      system 'clear' if play_again == 'Y'
    end until play_again == 'N'
  end

  def pick_winner
    if player == computer
      puts "It's a tie!"
    elsif player > computer
      display_victory_message(player.choice)
      puts "You win!"
    else
      display_victory_message(computer.choice)
      puts "Computer wins!"
    end
  end

  def display_victory_message(winning_choice)
    case winning_choice
    when 'R'
      puts 'The rock beats scissors'
    when 'S'
      puts 'The scissors beat paper'
    when 'P'
      puts 'The paper beats rock'
    end
  end
end

class Player
  include Comparable
  attr_accessor :choice

  def <=>(computer)
    if self.choice == computer.choice
      0
    elsif (self.choice == 'P' && computer.choice == 'R') ||
          (self.choice == 'R' && computer.choice == 'S') ||
          (self.choice == 'S' && computer.choice == 'P')
      1
    else
      -1
    end
  end

  def translate
    Plays.new.letter_to_word(@choice)
  end
end

class Plays
  CHOICES =
    { 'P' => 'Paper',
      'R' => 'Rock',
      'S' => 'Scissors' }

  def letter_to_word(letter)
    CHOICES[letter]
  end
end

RockPaperScissors.new

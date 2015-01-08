# Object Oriented Paper Rock Scissors
# Tealeaf Academy C01L02

class RockPaperScissors

  def initialize
    to_s
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
      end until 'PRS'.include?(choice)
      player = Player.new(choice)
      computer = Player.new(['P','R','S'].sample)
      puts "Player plays #{player.translate} and Computer plays " +
           "#{computer.translate}"
      Winner.new(player.choice, computer.choice).declare
      puts "Do you want to play again? (Y/N)"
      play_again = gets.chomp.upcase
      system 'clear' if play_again == 'Y'
    end until play_again == 'N'
  end
end

class Winner
  def initialize(user_choice, computer_choice)
    @user_choice = user_choice
    @computer_choice = computer_choice
  end

  def declare
    if @user_choice == @computer_choice
      puts 'It is a tie!'
    elsif (@user_choice == 'R' && @computer_choice == 'S') ||
          (@user_choice == 'S' && @computer_choice == 'P') ||
          (@user_choice == 'P' && @computer_choice == 'R')
      puts 'Player wins!'
    else
      puts 'The computer wins!'
    end
  end
end

class Player
  attr_accessor :choice

  def initialize(choice)
    @choice = choice
  end

  def translate
    Plays.new.letter_to_word(@choice)
  end
end

class Plays
  def initialize
    @options =
      { 'P' => 'Paper',
        'R' => 'Rock',
        'S' => 'Scissors' }
  end

  def letter_to_word(letter)
    @options[letter]
  end
end

RockPaperScissors.new

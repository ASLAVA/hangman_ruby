# frozen_string_literal: true

require_relative 'display'
require_relative 'filehandler'

# Class that controls the flow of the game.
class Game
  include Display
  include FileHandler
  attr_reader :body, :guess_correct, :guess_wrong

  MRUNLUCKY = ['|', 'O', '|', '/', '\\', '/', '\\'].freeze

  def initialize
    @hidden_word = []
    @wrong_guess = 0
    @guess = []
    @guess_correct = []
    @guess_wrong = []
    @body = [' ', ' ', ' ', ' ', ' ', ' ', ' ']
  end

  def menu
    welcome
    choice = gets.chomp!
    process_menu(choice.downcase)
  end

  def process_menu(choice)
    if %w[s start].include?(choice)
      start_game
    elsif %w[l load].include?(choice)
      # add loading in stuff
    elsif %w[q quit].include?(choice)
      good_bye
    else
      valid_choice_prompt
      menu
    end
  end

  def start_game
    select_secret_word
    play_game
  end

  def display_game
    hung_man_build
    board_display self
  end

  def hung_man_build
    MRUNLUCKY.each_with_index do |cell, index|
      @body[index] = cell if index < @wrong_guess
    end
  end

  def play_game
    until game_over? do
      display_game
      print @hidden_word
      process_guess valid_input
    end
  end

  def valid_input
    valid_choice_prompt
    input = gets.chomp.strip.downcase
    valid_input if previously_guessed?(input) || input.empty?
    input
  end

  def game_over?
    @wrong_guess > 6 || @hidden_word == @guess_correct
  end

  def previously_guessed?(new_guess)
    @guess.include?(new_guess)
  end

  private

  def select_secret_word
    @hidden_word = word_list.sample.downcase.split('')
    @hidden_word.length.times { @guess_correct.push(' ') }
  end

  def process_guess(input)
    @hidden_word.each_with_index do |letter, index|
      @guess_correct[index] = letter if letter == input
      print "#{letter} #{input}"
    end
    @wrong_guess += 1 unless @hidden_word.include?(input)
    @guess_wrong.push(input) unless @hidden_word.include?(input)
    hung_man_build
  end
end

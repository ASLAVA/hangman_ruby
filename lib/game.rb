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
    @hidden_word = ''
    @wrong_guess = 5
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
      valid_choice
      menu
    end
  end

  def start_game
    # game_display(self)
    select_secret_word
    display_game
    # play_game
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

  private

  def select_secret_word
    @hidden_word = word_list.sample
    @hidden_word.length.times { @guess_correct.push(' ') }
  end
end

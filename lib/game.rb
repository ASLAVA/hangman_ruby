# frozen_string_literal: true

require_relative 'display'
require_relative 'filehandler'

# Class that controls the flow of the game.
class Game
  include Display
  include FileHandler

  def initialize
    @hidden_word = ''
    @guess_remain = 7
    @guess_correct = []
    @guess_wrong = []
  end

  def start
    choice = welcome
    if %w[s start].include?(choice)
      @hidden_word = select_secret_word
      start_game
    elsif %w[l load].include?(choice)
      # add loading in stuff
    else
      puts 'Thank you for playing!'
    end
  end

  def start_game
    puts 'next step'
  end

  private

  def select_secret_word
    word_list.sample
  end
end

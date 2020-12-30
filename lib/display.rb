# frozen_string_literal: true

require 'erb'

# module to display/process game messages
module Display
  MENU_OPTIONS = %w[s start l load q quit].freeze
  GAME_OPTIONS = %w[s save q quit].freeze
  def logo
    <<~HEREDOC
      #{'     '}
             ▄▄   ▄▄ ▄▄▄▄▄▄▄ ▄▄    ▄ ▄▄▄▄▄▄▄ ▄▄   ▄▄ ▄▄▄▄▄▄▄ ▄▄    ▄
            █  █ █  █       █  █  █ █       █  █▄█  █       █  █  █ █
            █  █▄█  █   ▄   █   █▄█ █   ▄▄▄▄█       █   ▄   █   █▄█ █
            █       █  █▄█  █       █  █  ▄▄█       █  █▄█  █       █
            █   ▄   █       █  ▄    █  █ █  █       █       █  ▄    █
            █  █ █  █   ▄   █ █ █   █  █▄▄█ █ ██▄██ █   ▄   █ █ █   █
            █▄▄█ █▄▄█▄▄█ █▄▄█▄█  █▄▄█▄▄▄▄▄▄▄█▄█   █▄█▄▄█ █▄▄█▄█  █▄▄█
    HEREDOC
  end

  def menu_text
    <<~HEREDOC
      #{'      '}
            Save Mr. Unlucky! You have 7 attempts to guess a random
            word that is between 7 and 12 letters long and save him!
            With each bad guess Mr. Unlucky gets closer to being hung!
      #{'      '}
            Would you like to save him?
      #{'      '}
            (S) START
            (L) LOAD
            (Q) QUIT
      #{'      '}
    HEREDOC
  end

  def valid_choice_prompt
    puts 'Please enter a valid choice'
  end

  def good_bye
    puts 'Thank you for playing!',
         'Goodbye!'
  end

  def welcome
    puts logo
    puts menu_text
  end

  def board_display(game_obj)
    # system 'clear'
    puts logo
    puts info_display(game_obj)
  end

  def info_display(game_obj)
    <<~HEREDOC
      #{'    '}
              ▄▄▄▄▄▄▄▄
              #{game_obj.body[0]}      █   Word: #{game_obj.guess_correct.join(' ')}
              #{game_obj.body[1]}      █         #{correct_guess_hint_line(game_obj.guess_correct.length)}
             #{game_obj.body[3]}#{game_obj.body[2]}#{game_obj.body[4]}     █
             #{game_obj.body[5]} #{game_obj.body[6]}     █
                     █   Wrong Guesses:  #{game_obj.guess_wrong.join(' ')}
              ▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄
    HEREDOC
  end

  def correct_guess_hint_line(num)
    hint_line = []
    num.times { hint_line.push('‾') }
    hint_line.join(' ')
  end
end

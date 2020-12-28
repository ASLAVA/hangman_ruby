# frozen_string_literal: true

require 'erb'

# module to display/process game messages
module Display
  MENU_OPTIONS = %w[s start l load q quit].freeze
  GAME_OPTIONS = %w[s save q quit].freeze
  def logo
    puts ' ▄▄   ▄▄ ▄▄▄▄▄▄▄ ▄▄    ▄ ▄▄▄▄▄▄▄ ▄▄   ▄▄ ▄▄▄▄▄▄▄ ▄▄    ▄',
         '█  █ █  █       █  █  █ █       █  █▄█  █       █  █  █ █',
         '█  █▄█  █   ▄   █   █▄█ █   ▄▄▄▄█       █   ▄   █   █▄█ █',
         '█       █  █▄█  █       █  █  ▄▄█       █  █▄█  █       █',
         '█   ▄   █       █  ▄    █  █ █  █       █       █  ▄    █',
         '█  █ █  █   ▄   █ █ █   █  █▄▄█ █ ██▄██ █   ▄   █ █ █   █',
         '█▄▄█ █▄▄█▄▄█ █▄▄█▄█  █▄▄█▄▄▄▄▄▄▄█▄█   █▄█▄▄█ █▄▄█▄█  █▄▄█'
  end

  def menu
    puts "\n> (S) START",
         '> (L) LOAD',
         '> (Q) QUIT'
    print '> :'
    input = gets.chomp!
    menu until MENU_OPTIONS.include?(input.downcase)
    input
  end

  def welcome
    logo
    menu
  end
end



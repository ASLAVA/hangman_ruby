# frozen_string_literal: true

require 'erb'

# module to display game messages
module Display
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
    puts "\n> START NEW",
         '> LOAD SAVE',
         '> QUIT'
  end

  def welcome
    logo
    menu
  end
end



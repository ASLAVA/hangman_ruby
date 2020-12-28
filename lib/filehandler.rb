# frozen_string_literal: true

# module that processes dictionary data for puzzle selection
# as well as saving game data to be played at later time
module FileHandler
  def word_list
    words = File.open('5desk.txt', 'r')
    list = words.readlines.map(&:chomp)
    words.close
    list.select { |word| word.length > 4 && word.length < 12 }
  end
end


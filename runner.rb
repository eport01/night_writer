require './lib/night_writer'
require './lib/dictionary'
require './lib/night_reader'




#uncomment these out for integration testing:
# ARGV[0] = 'message.txt'
# ARGV[1] = 'braille.txt'

# night_writer = NightWriter.new(ARGV[0], ARGV[1])
# night_writer.braille_print

night_reader = NightReader.new(ARGV[0], ARGV[1])
require 'pry'; binding.pry
night_reader.split_lines







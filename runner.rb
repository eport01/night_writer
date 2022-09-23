require './lib/night_writer'
# content = File.read(ARGV[0])
# # require 'pry'; binding.pry
# File.write(ARGV[1], content)
# puts " Created #{ARGV[1]} containing #{ARGV[1].length} characters"

ARGV[0] = 'message.txt'
ARGV[1] = 'braille.txt'
content = File.read(ARGV[0])
night_writer = NightWriter.new('message.txt', 'braille.txt')
File.write('braille.txt', content)
puts " Created #{'braille.txt'} containing #{'braille.txt'.length} characters"

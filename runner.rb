require './lib/night_writer'
require './lib/dictionary'




#uncomment these out for integration testing:
# ARGV[0] = 'message.txt'
# ARGV[1] = 'braille.txt'

# content = File.read(ARGV[0])
night_writer = NightWriter.new(ARGV[0], ARGV[1]).translate
# File.write(ARGV[1], content)
# puts " Created #{ARGV[1]} containing #{ARGV[1].length} characters"
# require 'pry'; binding.pry
# night_writer.dictionary.translate_letter("h")

# message = File.readlines(night_writer.input_file)
# translation = night_writer.eng_to_br(message)
# File.write(night_writer.output_file, translation)




# require 'pry'; binding.pry
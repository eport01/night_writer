require './lib/dictionary'
# require './dictionary'
class NightWriter
  attr_reader :write_to_file, :dictionary, :input_file, :output_file, :eng_to_br
  def initialize(input_file, output_file)
    @input_file = ARGV[0]
    @output_file = ARGV[1]
    @dictionary = Dictionary.new
  end
  # def eng_to_br(letter) 
  #   @dictionary.translate_letter(letter)
  # end

  def test 
    content = File.read(@input_file)
    # require 'pry'; binding.pry
    translate = @dictionary.translate_letter(content)
    File.write(ARGV[1], translate)
    puts " Created #{ARGV[1]} containing #{content.length} characters"
  end
  # def translate
  #   @input_file
  #   @dictionary.alphabet
  #   require 'pry'; binding.pry
  # end
end
#put this thing below in the runner maybe?
night_writer = NightWriter.new(@input_file, @output_file)

# require 'pry'; binding.pry
#ruby ./lib/night_writer.rb message.txt braille.txt
#should read: Created 'braille.txt' containing 256 characters
#make fixture files to test?
#should I make a second class (parent of this). and then reference that in test?
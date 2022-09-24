require './lib/dictionary'

class NightWriter
  attr_reader :write_to_file, :dictionary, :input_file, :output_file, :eng_to_br
  def initialize(input_file, output_file)
    @input_file = ARGV[0]
    @output_file = ARGV[1]
    @dictionary = Dictionary.new
  end


  def translate 
    content = File.read(@input_file)
    individual_letters = content.scan(/\w/)
    braille_letters = []
    individual_letters.each do |letter|
      braille_letters << @dictionary.translate_letter(letter)
    end
    braille_letters
    #content needs to be split up (in dictionary class?)
    # require 'pry'; binding.pry
    # translation = @dictionary.translate_letter(content)
    File.write(ARGV[1], braille_letters)
    puts " Created #{ARGV[1]} containing #{braille_letters.length} characters"
  end

end
#put this thing below in the runner maybe?
night_writer = NightWriter.new(@input_file, @output_file)


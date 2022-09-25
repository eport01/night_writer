require './lib/dictionary'

class NightReader
  attr_reader :input_file, :output_file, :content
  def initialize(input_file, output_file)
    @input_file = ARGV[0]
    @output_file = ARGV[1]
    @dictionary = Dictionary.new
  end

  def read_file 
    File.read(input_file)
  end

  def individual_letters
    #first write each letter on one line?
  end

  def translate_braille(character) 
    @dictionary.translate_braille(character)
  end

end
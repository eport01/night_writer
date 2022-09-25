require './lib/dictionary'

class NightReader 
  attr_reader :input_file, :output_file, :content, :dictionary, :split_lines, :night_read_file
  def initialize(input_file, output_file)
    @input_file = ARGV[0]
    @output_file = ARGV[1]
    @dictionary = Dictionary.new
  end

  def night_read_file 
    @content = File.read(input_file)
  end

  def split_lines 
    night_read_file
    #first make sure braille is <40 length
    #split into an array w/ 3 lines
    #first separate the braille characters?
    #first write each letter on one line?
    #take two characters from 3 lines, print horizontally, concat together 
   
    @lines = @content.split.each_slice(3).to_a 
    # @lines.map {|character| character.scan(/../)}
    @nested = @lines.map {|character| character.map {|letter| letter.scan(/../)}}
    # @letters = @nested[0].zip(*(nested[1..-1]))
    @letters = @nested.map {|group| group[0].zip(*(group[1..-1]))}
    @braille_lines = @letters.map {|groups| groups.map {|group| group.join("\n")}}
    # @braille_line = @letters.map {|letter| letter.join("\n")}
    
    #@dictionary.translate_braille(character)
    @braille_lines.map {|group| group.map {|letter| night_reader.dictionary.translate_braille(letter)}}
  
  end

  # def split_characters
  #   #need to iterate over array 
  #   @lines.first.scan(/../)
  # end

  # def translate_braille(character) 
  #   @dictionary.translate_braille(character)
  # end

end
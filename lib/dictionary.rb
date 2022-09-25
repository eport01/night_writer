
class Dictionary
  attr_reader :alphabet, :translate_letter, :translate_braille
  def initialize
    # @night_writer = NightWriter.new(@input_file, @output_file)
    @alphabet = [
      {"a" => "0.\n..\n.."},
      {"b" => "0.\n0.\n.."},
      {"c" => "00\n..\n.."},
      {"d" => "00\n.0\n.."},
      {"e" => "0.\n.0\n.."},
      {"f" => "00\n0.\n.."},
      {"g" => "00\n00\n.."},
      {"h" => "0.\n00\n.."},
      {"i" => ".0\n0.\n.."},
      {"j" => ".0\n00\n.."},
      {"k" => "0.\n..\n0."},
      {"l" => "0.\n0.\n0."},
      {"m" => "00\n..\n0."},
      {"n" => "00\n.0\n0."},
      {"o" => "0.\n.0\n0."},
      {"p" => "00\n0.\n0."},
      {"q" => "00\n00\n0."},
      {"r" => "0.\n00\n0."},
      {"s" => ".0\n0.\n0."},
      {"t" => ".0\n00\n0."},
      {"u" => "0.\n..\n00"},
      {"v" => "0.\n0.\n00"},
      {"w" => ".0\n00\n.0"},
      {"x" => "00\n..\n00"},
      {"y" => "00\n.0\n00"},
      {"z" => "0.\n.0\n00"},
      {" " => "..\n..\n.."}
    ]
  end

  #write a method that takes a word in and splits it into individual letters,
  #call method on each letter 

  def translate_letter(letter)
    # @alphabet.select {|letters| letters.find {|eng, braille| p braille if eng  == letter}}[0].values.flatten
    test = @alphabet.select {|letters| letters.find {|eng, braille| eng  == letter}}[0].values[0]
    
  end

  def translate_braille(character)
    @alphabet.select {|letters| letters.find {|eng, braille| braille  == character}}[0].keys[0]

  end

  #maybe move alphabet to method 

  # def translate 
  #   @input_file
  #   require 'pry'; binding.pry
  # end

end
# dictionary = Dictionary.new 
# p dictionary.translate
# [h = "0.\n00\n.."]
# puts h 
# dictionary = Dictionary.new

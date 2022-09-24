
class Dictionary
  attr_reader :alphabet, :translate_letter
  def initialize
    # @night_writer = NightWriter.new(@input_file, @output_file)
    @alphabet = [
      {"a" => "0.\n..\n.."},
      {"b" => },
      {"c" => },
      {"d" => },
      {"e" => },
      {"f" => },
      {"g" => },
      {"h" => "0.\n00\n.."},
      {"i" => },
      {"j" => },
      {"k" => },
      {"l" => },
      {"m" => },
      {"n" => },
      {"o" => },
      {"p" => },
      {"q" => },
      {"r" => },
      {"s" => },
      {"t" => },
      {"u" => },
      {"v" => },
      {"w" => },
      {"x" => },
      {"y" => },
      {"z" => },
    ]
  end

  def translate_letter(letter)
    @alphabet.select {|letters| letters.find {|eng, braille| eng  == letter}}[0].values[0]
  end

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

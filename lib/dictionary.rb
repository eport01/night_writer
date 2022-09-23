class Dictionary
  attr_reader :alphabet
  def initialize
    @alphabet = [{"h" => "0.\n00\n.."}]
  end

end

# [h = "0.\n00\n.."]
# puts h 
dictionary = Dictionary.new
puts dictionary.alphabet
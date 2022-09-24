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
    # translated = braille_letters.map {|letter| print letter}
    # individual_letters.each {|letter| braille_letters << @dictionary.translate_letter(letter)}
    # translated = braille_letters.join

    # Split the braille_letters array into a nested array where each element is an array with max 40 letters
    # Then we can do a .each wrapped around the for loop and eventually join it all together
    all_letters  = []
    braille_letters.each_slice(5) {|letter| all_letters << letter}

    # IDEA
    # Iterate over the array and use
    # braille_letters[0].lines.map(&:chomp).zip(braille_letters[1].lines.map(&:chomp)).map(&:join).join("\n")
    total_block = []
    for i in all_letters do
      block = i[0]
      array_length = i.length.to_i - 1
      for j in 1..array_length do
        block = block.lines.map(&:chomp).zip(i[j].lines.map(&:chomp)).map(&:join).join("\n")
      end
      # Save block to another thing that we will then print with a "\n" between elements
      total_block << block
      total_block << " "
    end
    
    # braille_block = braille_letters[0]
    # array_length = braille_letters.length.to_i - 1
    # for i in 1..array_length do
    #   braille_block = braille_block.lines.map(&:chomp).zip(braille_letters[i].lines.map(&:chomp)).map(&:join).join("\n")
    # end
    # GO TO NEW "LINE" AT i = 41, 81, 121, 161, ......
# require 'pry'; binding.pry
    #content needs to be split up (in dictionary class?)
    # require 'pry'; binding.pry
    # translation = @dictionary.translate_letter(content)
    # translation = File.write(ARGV[1], translated)
    translation = File.write(ARGV[1], total_block.join("\n"))


    
    puts " Created #{ARGV[1]} containing #{braille_letters.length} characters"
  end

  

end
#put this thing below in the runner maybe?
night_writer = NightWriter.new(@input_file, @output_file)


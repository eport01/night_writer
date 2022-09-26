require './lib/dictionary'

class NightWriter
  attr_reader :write_to_file, :dictionary, :read_file, :input_file, :output_file, :eng_to_br, :translate
  def initialize(input_file, output_file)
    @input_file = ARGV[0]
    @output_file = ARGV[1]
    @dictionary = Dictionary.new
  end

  def read_file 
    File.read(input_file)
  end

  def individual_letters
    @content = read_file.scan(/\w/)
  end

  def translate
    individual_letters
    @braille_letters = []
    @content.each do |letter|
      @braille_letters << @dictionary.translate_letter(letter)
    end
    @braille_letters
  end 

  def line_blocking
    translate
    @all_letters  = []
    @braille_letters.each_slice(40) {|letter| @all_letters << letter}
    @all_letters
  end 

  def horizontal_blocks
    line_blocking
    @total_block = []
    for i in @all_letters do
      block = i[0]
      array_length = i.length.to_i - 1
      for j in 1..array_length do
        block = block.lines.map(&:chomp).zip(i[j].lines.map(&:chomp)).map(&:join).join("\n")
      end
      @total_block << block
    end
    @total_block
  end

  def braille_print 
    horizontal_blocks
    translation = File.write(ARGV[1], @total_block.join("\n"))
    puts " Created #{ARGV[1]} containing #{@braille_letters.length} characters"
  end
end




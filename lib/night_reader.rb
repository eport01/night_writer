require './lib/dictionary'

class NightReader < Dictionary
  attr_reader :input_file, :output_file, :content, :dictionary, :split_lines, :night_read_file
  def initialize(input_file, output_file)
    @input_file = ARGV[0]
    @output_file = ARGV[1]
    super()
  end

  def night_read_file 
    @content = File.read(input_file)
  end

  def split_lines 
    night_read_file 
    @lines = @content.split.each_slice(3).to_a 
  end 

  def groups_of_two
    split_lines
    @twos = @lines.map {|character| character.map {|letter| letter.scan(/../)}}
  end 

  def combine_three_arrays 
    groups_of_two
    @combined = @twos.map {|group| group[0].zip(*(group[1..-1]))}
  end

  def write_horizontal
    combine_three_arrays
    @braille_lines = @combined.map {|groups| groups.map {|group| group.join("\n")}}.flatten
  end 

  def braille_translate 
    write_horizontal
    translated = []
    @braille_lines.each do |character| 
      translated << translate_braille(character)
    end
    translated
    @english = translated.join 
  end

  def english_print
    braille_translate
    translation = File.write(ARGV[1], @english)
    puts "Created #{ARGV[1]} containing #{@english.length} characters"
  end
end

#### COMMENT OUT BELOW FOR TESTING #########

night_reader = NightReader.new(ARGV[0], ARGV[1])
night_reader.english_print

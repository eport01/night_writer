
class NightWriter
  attr_reader :write_to_file
  def initialize(input_file, output_file)
    @input_file = ARGV[0]
    @output_file = ARGV[1]
  end
  def write_to_file
    # content = File.read(ARGV[0])
    # content = File.read(@input_file)

 
    # File.write(@output_file, content)
    # puts " Created #{@output_file} containing #{@output_file.length} characters"
   
  end
end
#put this thing below in the runner maybe?
night_writer = NightWriter.new(@input_file, @output_file)

# require 'pry'; binding.pry
#ruby ./lib/night_writer.rb message.txt braille.txt
#should read: Created 'braille.txt' containing 256 characters
#make fixture files to test?
#should I make a second class (parent of this). and then reference that in test?
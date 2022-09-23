class NightWriter
  def write_to_file
    content = File.read(ARGV[0])
    File.write(ARGV[1], content)
    puts " Created #{ARGV[1]} containing #{ARGV[1].length} characters"
  end
end

NightWriter.new.write_to_file

#ruby ./lib/night_writer.rb message.txt braille.txt
#should read: Created 'braille.txt' containing 256 characters
require './lib/night_writer'



#uncomment these out for integration testing:
# ARGV[0] = 'message.txt'
# ARGV[1] = 'braille.txt'
content = File.read(ARGV[0])
night_writer = NightWriter.new(ARGV[0], ARGV[1])
File.write(ARGV[1], content)
puts " Created #{ARGV[1]} containing #{ARGV[1].length} characters"
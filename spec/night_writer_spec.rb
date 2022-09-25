require './spec_helper'
require './lib/night_writer'
require './lib/dictionary'


RSpec.describe NightWriter do 
  before(:each) do 
    # @night_writer = NightWriter.new('./lib/message.txt', './lib/braille.txt').write_to_file
    # @night_writer.input_file = './lib/message.txt'
    night_writer = NightWriter.new('./lib/message.txt', './lib/braille.txt')
    ARGV[0] = './lib/message.txt'
    ARGV[1] = './lib/braille.txt'
  end 

  it 'exists' do 
    night_writer = NightWriter.new('./lib/message.txt', './lib/braille.txt')
    expect(night_writer).to be_an_instance_of(NightWriter)
  end 

  it ' is instantiated with two files' do 
    night_writer = NightWriter.new('./lib/message.txt', './lib/braille.txt')
    allow(night_writer).to receive(ARGV[0]).and_return(ARGV[1])
    expect(ARGV).to eq(["./lib/message.txt", "./lib/braille.txt"])
  end

  it 'can read a file' do
    # require 'pry'; binding.pry
    night_writer = NightWriter.new('./test.txt', './braille_test.txt')
    allow(night_writer).to receive(:input_file).and_return('./test.txt')
    # require 'pry'; binding.pry
    expect(night_writer.read_file).to eq("helloworld")
  end

  it 'can split up individual letters into an array of strings' do 
    night_writer = NightWriter.new('./test.txt', './braille_test.txt')
    allow(night_writer).to receive(:input_file).and_return('./test.txt')
    expect(night_writer.individual_letters).to eq(["h", "e", "l", "l", "o", "w", "o", "r", "l", "d"])
  end

  it 'can translate english letters into braille letters' do 
    night_writer = NightWriter.new('./test.txt', './braille_test.txt')
    allow(night_writer).to receive(:input_file).and_return('./test.txt')
    expect(night_writer.translate).to eq(["0.\n00\n..", "0.\n.0\n..", "0.\n0.\n0.", "0.\n0.\n0.", "0.\n.0\n0.", ".0\n00\n.0", "0.\n.0\n0.", "00\n..\n..", "0.\n0.\n0.", "00\n.0\n.."])
  end

  it 'splits the array of the translate method into a nested array of 40 characters' do 
    night_writer = NightWriter.new('./long_test.txt', './braille_test.txt')
    allow(night_writer).to receive(:input_file).and_return('./long_test.txt')
    expect(night_writer.line_blocking.count).to eq(2)

    #test a file w/ more than 40 characters 
    # require 'pry'; binding.pry
  end

  
#test length of output file 
#night_writer.output_file.length
#test if file exists
#stub the return of anything else
#tell it what the messaage is and what the return is 
end
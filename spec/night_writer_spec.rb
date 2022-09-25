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

  it 'has an input file and an output file' do 

  end

  xit 'can translate one letter' do 
    night_writer = NightWriter.new('./lib/message.txt', './lib/braille.txt')
    @dictionary = Dictionary.new
# require 'pry'; binding.pry
    allow(night_writer.translate).to receive(h)
    expect(night_writer.translate).to eq("0.\n00\n..")
  end

  it 'can read a file' do
    # require 'pry'; binding.pry
    expect(@night_writer.read_file).to eq(1)
    
  end
#test if file exists
#stub the return of anything else
#tell it what the messaage is and what the return is 
end
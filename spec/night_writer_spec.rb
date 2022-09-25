require './spec_helper'
require './lib/night_writer'
require './lib/dictionary'


RSpec.describe NightWriter do 
  before(:each) do 
    # @night_writer = NightWriter.new('./lib/message.txt', './lib/braille.txt').write_to_file
    # @night_writer.input_file = './lib/message.txt'
    night_writer = NightWriter.new('./message.txt', './braille.txt')
    ARGV[0] = './message.txt'
    ARGV[1] = './braille.txt'
  end 

  it 'exists' do 
    night_writer = NightWriter.new('./message.txt', './braille.txt')
    expect(night_writer).to be_an_instance_of(NightWriter)
  end 

  it ' is instantiated with two files' do 
    night_writer = NightWriter.new('./message.txt', './braille.txt')
    allow(night_writer).to receive(ARGV[0]).and_return(ARGV[1])
    expect(ARGV).to eq(["./message.txt", "./braille.txt"])
  end

  it 'can read a file' do
    # require 'pry'; binding.pry
    night_writer = NightWriter.new('./fixture_files/test.txt', './fixture_files/braille_test.txt')
    allow(night_writer).to receive(:input_file).and_return('./fixture_files/test.txt')
    # require 'pry'; binding.pry
    expect(night_writer.read_file).to eq("helloworld")
  end

  it 'can split up individual letters into an array of strings' do 
    night_writer = NightWriter.new('./fixture_files/test.txt', './fixture_files/braille_test.txt')
    allow(night_writer).to receive(:input_file).and_return('./fixture_files/test.txt')
    expect(night_writer.individual_letters).to eq(["h", "e", "l", "l", "o", "w", "o", "r", "l", "d"])
  end

  it 'can translate english letters into braille letters' do 
    night_writer = NightWriter.new('./fixture_files/test.txt', './fixture_files/braille_test.txt')
    allow(night_writer).to receive(:input_file).and_return('./fixture_files/test.txt')
    expected = ["0.\n00\n..", "0.\n.0\n..", "0.\n0.\n0.", "0.\n0.\n0.", "0.\n.0\n0.", ".0\n00\n.0", "0.\n.0\n0.", "0.\n00\n0.", "0.\n0.\n0.", "00\n.0\n.."]
    expect(night_writer.translate).to eq(expected)
  end

  it 'splits the array of the translate method into a nested array of 40 characters' do 
    night_writer = NightWriter.new('./fixture_files/long_test.txt', './fixture_files/long_braille.txt')
    allow(night_writer).to receive(:input_file).and_return('./fixture_files/long_test.txt')
    expect(night_writer.line_blocking.count).to eq(2)
  end

  it 'prints on a new line after 40 characters' do 
    night_writer = NightWriter.new('./fixture_files/long_test.txt', './fixture_files/long_braille.txt')
    allow(night_writer).to receive(:input_file).and_return('./fixture_files/long_test.txt')
    expected = ["0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.\n00.00.0..000.00.0..000.00.0..000.00.0..000.00.0..000.00.0..000.00.0..000.00.0..0\n....0.0.0.....0.0.0.....0.0.0.....0.0.0.....0.0.0.....0.0.0.....0.0.0.....0.0.0.",
      "0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.\n00.00.0..000.00.0..000.00.0..000.00.0..000.00.0..000.00.0..000.00.0..0\n....0.0.0.....0.0.0.....0.0.0.....0.0.0.....0.0.0.....0.0.0.....0.0.0."]
    expect(night_writer.horizontal_blocks).to eq(expected)
  end

  it 'translates input file and prints to output file' do 
    night_writer = NightWriter.new('./fixture_files/test.txt', './fixture_files/braille_test.txt')
    allow(night_writer).to receive(:input_file).and_return('./fixture_files/test.txt')
    allow(night_writer).to receive(:output_file).and_return('./fixture_files/braille_test.txt')
    # expected = File.read(night_writer.output_file)
    # require 'pry'; binding.pry
    night_writer.braille_print
    expected = File.read(night_writer.output_file)
    expected = "0.0.0.0.0..00.0.0.00\n00.00.0..000.0000..0\n....0.0.0..00.0.0..."
    expect(expected).to eq(expected)
  end
end


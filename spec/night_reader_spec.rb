require './spec_helper'
require './lib/night_reader'
require './lib/dictionary'

RSpec.describe NightReader do 

  it 'exists' do 
    night_reader = NightReader.new('./fixture_files/reader_input.txt', './fixture_files/reader_output.txt')
    expect(night_reader).to be_an_instance_of(NightReader)
  end

  it 'can read an input file' do 
    night_reader = NightReader.new('./fixture_files/reader_input.txt', './fixture_files/reader_output.txt')
    allow(night_reader).to receive(:input_file).and_return('./fixture_files/reader_input.txt')
    expected = "0.0.0.0.0....00.0.0.00\n00.00.0..0..00.0000..0\n....0.0.0....00.0.0..."
    expect(night_reader.night_read_file).to eq(expected)
  end

  it 'can split a line of braille into ' do 
    night_reader = NightReader.new('./fixture_files/reader_input.txt', './fixture_files/reader_output.txt')
    allow(night_reader).to receive(:input_file).and_return('./fixture_files/reader_input.txt')
    expected = [["0.0.0.0.0....00.0.0.00", "00.00.0..0..00.0000..0", "....0.0.0....00.0.0..."]]
    expect(night_reader.split_lines).to eq(expected) 
  end

  it ' can split each line into new arrays where each element is two braille cells' do 
    night_reader = NightReader.new('./fixture_files/reader_input.txt', './fixture_files/reader_output.txt')
    allow(night_reader).to receive(:input_file).and_return('./fixture_files/reader_input.txt')
    expected = [[["0.", "0.", "0.", "0.", "0.", "..", ".0", "0.", "0.", "0.", "00"],
    ["00", ".0", "0.", "0.", ".0", "..", "00", ".0", "00", "0.", ".0"],
    ["..", "..", "0.", "0.", "0.", "..", ".0", "0.", "0.", "0.", ".."]]]
    expect(night_reader.groups_of_two).to eq(expected) 
  end

  it 'takes the two corresponding cells in each of the three arrays and puts them in their own array' do 
    night_reader = NightReader.new('./fixture_files/reader_input.txt', './fixture_files/reader_output.txt')
    allow(night_reader).to receive(:input_file).and_return('./fixture_files/reader_input.txt')
    expected = [
    [["0.", "00", ".."],
    ["0.", ".0", ".."],
    ["0.", "0.", "0."],
    ["0.", "0.", "0."],
    ["0.", ".0", "0."],
    ["..", "..", ".."],
    [".0", "00", ".0"],
    ["0.", ".0", "0."],
    ["0.", "00", "0."],
    ["0.", "0.", "0."],
    ["00", ".0", ".."]]
    ]
    expect(night_reader.combine_three_arrays).to eq(expected) 
  end

  it 'can write braille characters horizontally separated by commas' do 
    night_reader = NightReader.new('./fixture_files/reader_input.txt', './fixture_files/reader_output.txt')
    allow(night_reader).to receive(:input_file).and_return('./fixture_files/reader_input.txt')
    expected = ["0.\n00\n..", "0.\n.0\n..", "0.\n0.\n0.", "0.\n0.\n0.", "0.\n.0\n0.", "..\n..\n..", ".0\n00\n.0", "0.\n.0\n0.", "0.\n00\n0.", "0.\n0.\n0.", "00\n.0\n.."]
    expect(night_reader.write_horizontal).to eq(expected) 
  end

  it 'can translate braille into english' do 
    night_reader = NightReader.new('./fixture_files/reader_input.txt', './fixture_files/reader_output.txt')
    allow(night_reader).to receive(:input_file).and_return('./fixture_files/reader_input.txt')
    expect(night_reader.braille_translate).to eq("hello world") 
  end

  it 'can print this braille to english translation into a new file' do 
    ARGV[0] = './fixture_files/reader_input.txt'
    ARGV[1] = './fixture_files/reader_output.txt'
    night_reader = NightReader.new('./fixture_files/reader_input.txt', './fixture_files/reader_output.txt')
    allow(night_reader).to receive(:input_file).and_return('./fixture_files/reader_input.txt')
    allow(night_reader).to receive(:output_file).and_return('./fixture_files/reader_output.txt')
    night_reader.english_print
    expected = File.read('./fixture_files/reader_output.txt')
    expect(expected).to eq("hello world")
  end
end
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
end
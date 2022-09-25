require './spec_helper'
require './lib/night_reader'
require './lib/dictionary'

RSpec.describe NightReader do 
  # before(:each) do 
  #   @night_reader = NightReader.new('./reader_input.txt', './reader_output.txt')
  # end
  it 'exists' do 
    night_reader = NightReader.new('./reader_input.txt', './reader_output.txt')
    expect(night_reader).to be_an_instance_of(NightReader)
  end

  it 'can read an input file' do 
    night_reader = NightReader.new('./reader_input.txt', './reader_output.txt')
    allow(night_reader).to receive(:input_file).and_return('./reader_input.txt')
    expect(night_reader.night_read_file).to eq("0.0.0.0.0....00.0.0.00\n00.00.0..0..00.0000..0\n....0.0.0....00.0.0...\n\n")
# require 'pry'; binding.pry
  end
end
require './spec_helper'
require './lib/night_writer'
require './lib/dictionary'

RSpec.describe Dictionary do
  it 'exists' do 

  end

  it 'changes a to the braille equivalent' do 
    dictionary = Dictionary.new
    expect(dictionary.translate_letter("h")).to eq( "0.\n00\n..")
  end
end
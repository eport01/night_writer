require './spec_helper'
require './lib/night_writer'
require './lib/dictionary'

RSpec.describe Dictionary do
  it 'exists' do 
    dictionary = Dictionary.new
    expect(dictionary).to be_an_instance_of(Dictionary)
  end

  it 'changes a to the braille equivalent' do 
    dictionary = Dictionary.new
    expect(dictionary.translate_letter("h")).to eq( "0.\n00\n..")
    expect(dictionary.translate_letter("a")).to eq( "0.\n..\n..")
  end

  it 'translates braille to english' do 
    dictionary = Dictionary.new
    expect(dictionary.translate_braille("0.\n00\n..")).to eq("h")
  end

  it 'can translate punctuation' do 
    dictionary = Dictionary.new
    expect(dictionary.translate_letter("?")).to eq("..\n0.\n00")
  end
end
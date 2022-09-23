require './spec_helper'
require './lib/night_writer'
require './lib/english_to_braille'

RSpec.describe EnglishToBraille do
  it 'exists' do 

  end

  it 'changes a to the braille equivalent' do 
    english_to_braille = EnglishToBraille.new 
    expect(english_to_braille.translate_letter('h')).to eq(h)
  end
end
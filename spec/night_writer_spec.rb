require 'rspec'
require './lib/night_writer'




RSpec.describe NightWriter do 
  before(:each) do 
    @night_writer = NightWriter.new('./lib/message.txt', './lib/braille.txt').write_to_file
    # @night_writer.input_file = './lib/message.txt'
    ARGV[0] = './lib/message.txt'
    ARGV[1] = './lib/braille.txt'
  end 

  it 'exists' do 
    night_writer = NightWriter.new('./lib/message.txt', './lib/braille.txt')
    expect(night_writer).to be_an_instance_of(NightWriter)
    # allow(night_writer).to receive(ARGV[0]).and_return(ARGV[1])
    expect(night_writer).to be_an_instance_of(NightWriter)
    expect(ARGV).to eq(["./lib/message.txt", "./lib/braille.txt"])
  end
#test if file exists
#stub the return of anything else
#tell it what the messaage is and what the return is 
end
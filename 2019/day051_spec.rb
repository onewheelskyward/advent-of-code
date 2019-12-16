require 'rspec'
require_relative 'day5_intcode'

describe 'day5.1 tests' do
  it "tries 1" do
    input = "1"
    output = 1
    expect(day5_intcode(input)).to eq(output)
  end
end

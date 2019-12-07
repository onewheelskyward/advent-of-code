require 'rspec'
require_relative 'pw_cracker'

describe 'day4.1 tests' do
  it "tries 111111" do
    input = "111111-111111"
    output = 1
    expect(pw_cracker(input)).to eq(output)
  end

  it "tries 223450" do
    input = "223450-223450"
    output = 0
    expect(pw_cracker(input)).to eq(output)
  end

  it "tries 123789" do
    input = "123789-123789"
    output = 0
    expect(pw_cracker(input)).to eq(output)
  end

  it "does day 4.1" do
    input = "193651-649729"
    output = 1605
    expect(pw_cracker(input)).to eq(output)
  end
end

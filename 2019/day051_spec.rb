require 'rspec'
require_relative 'intcode_cpu'

describe 'day5.1 tests' do
  it "tries 1" do
    input = "3,0,4,0,99"
    output = "1,0,4,0,99"
    cpu = IntcodeCpu.new(input, 1)
    expect(cpu.process).to eq(output)
  end

  it "tries 2" do
    input = "1002,4,3,4,33"
    output = "1002,4,3,4,99"
    cpu = IntcodeCpu.new(input, 1)
    expect(cpu.process).to eq(output)
  end

  it "tries 3" do
    input = "1101,100,-1,4,0"
    output = "1101,100,-1,4,99"
    cpu = IntcodeCpu.new(input, 1)
    expect(cpu.process).to eq(output)
  end
end

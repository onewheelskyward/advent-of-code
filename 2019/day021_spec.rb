require 'rspec'
require_relative 'intcode_cpu'

describe 'day2 tests' do
  it "test 1" do
    input = '1,0,0,0,99'
    expected = '2,0,0,0,99'

    cpu = IntcodeCpu.new(input)
    output = cpu.process
    expect(output).to eq(expected)
  end

  it "test 2" do
    input = '2,3,0,3,99'
    expected = '2,3,0,6,99'

    cpu = IntcodeCpu.new(input)
    output = cpu.process
    expect(output).to eq(expected)
  end

  it "test 3" do
    input = '2,4,4,5,99,0'
    expected = '2,4,4,5,99,9801'

    cpu = IntcodeCpu.new(input)
    output = cpu.process
    expect(output).to eq(expected)
  end

  it "test 4" do
    input = '1,1,1,4,99,5,6,0,99'
    expected = '30,1,1,4,2,5,6,0,99'

    cpu = IntcodeCpu.new(input)
    output = cpu.process
    expect(output).to eq(expected)
  end

  it 'runs the program' do
    input = '1,12,2,3,1,1,2,3,1,3,4,3,1,5,0,3,2,10,1,19,1,6,19,23,1,23,13,27,2,6,27,31,1,5,31,35,2,10,35,39,1,6,39,43,1,13,43,47,2,47,6,51,1,51,5,55,1,55,6,59,2,59,10,63,1,63,6,67,2,67,10,71,1,71,9,75,2,75,10,79,1,79,5,83,2,10,83,87,1,87,6,91,2,9,91,95,1,95,5,99,1,5,99,103,1,103,10,107,1,9,107,111,1,6,111,115,1,115,5,119,1,10,119,123,2,6,123,127,2,127,6,131,1,131,2,135,1,10,135,0,99,2,0,14,0'
    expected = '2782414,12,2,2,1,1,2,3,1,3,4,3,1,5,0,3,2,10,1,48,1,6,19,50,1,23,13,55,2,6,27,110,1,5,31,111,2,10,35,444,1,6,39,446,1,13,43,451,2,47,6,902,1,51,5,903,1,55,6,905,2,59,10,3620,1,63,6,3622,2,67,10,14488,1,71,9,14491,2,75,10,57964,1,79,5,57965,2,10,83,231860,1,87,6,231862,2,9,91,695586,1,95,5,695587,1,5,99,695588,1,103,10,695592,1,9,107,695595,1,6,111,695597,1,115,5,695598,1,10,119,695602,2,6,123,1391204,2,127,6,2782408,1,131,2,2782410,1,10,135,0,99,2,0,14,0'

    cpu = IntcodeCpu.new(input)
    output = cpu.process
    expect(output).to eq(expected)
  end
end

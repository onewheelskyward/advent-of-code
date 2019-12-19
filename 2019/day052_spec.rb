require 'rspec'
require_relative 'intcode_cpu'

describe 'day5.2 tests' do
  it "tries test 1 == 8" do
    input = "3,9,8,9,10,9,4,9,99,-1,8"
    output = 1
    cpu = IntcodeCpu.new(input, 8)
    cpu.process
    expect(cpu.output).to eq(output)
  end

  it "tries test 1 != 8" do
    input = "3,9,8,9,10,9,4,9,99,-1,8"
    output = 0
    cpu = IntcodeCpu.new(input, 4)
    cpu.process
    expect(cpu.output).to eq(output)
  end

  it "tries test 2 < 8" do
    input = "3,9,7,9,10,9,4,9,99,-1,8"
    output = 1
    cpu = IntcodeCpu.new(input, 4)
    cpu.process
    expect(cpu.output).to eq(output)
  end

  it "tries test 2 == 8" do
    input = "3,9,7,9,10,9,4,9,99,-1,8"
    output = 0
    cpu = IntcodeCpu.new(input, 8)
    cpu.process
    expect(cpu.output).to eq(output)
  end

  it "tries test 2 >= 8" do
    input = "3,9,7,9,10,9,4,9,99,-1,8"
    output = 0
    cpu = IntcodeCpu.new(input, 88)
    cpu.process
    expect(cpu.output).to eq(output)
  end

  it "tries test 3 == 8 immediate" do
    input = "3,3,1108,-1,8,3,4,3,99"
    output = 1
    cpu = IntcodeCpu.new(input, 8)
    cpu.process
    expect(cpu.output).to eq(output)
  end

  it "tries test 3 != 8 immediate" do
    input = "3,3,1108,-1,8,3,4,3,99"
    output = 0
    cpu = IntcodeCpu.new(input, 4)
    cpu.process
    expect(cpu.output).to eq(output)
  end

  it "tries test 4 < 8 immediate" do
    input = "3,3,1107,-1,8,3,4,3,99"
    output = 1
    cpu = IntcodeCpu.new(input, 4)
    cpu.process
    expect(cpu.output).to eq(output)
  end

  it "tries test 4 !< 8 immediate" do
    input = "3,3,1107,-1,8,3,4,3,99"
    output = 0
    cpu = IntcodeCpu.new(input, 9)
    cpu.process
    expect(cpu.output).to eq(output)
  end

  it "tries test 5 >0 = 1" do
    input = "3,12,6,12,15,1,13,14,13,4,13,99,-1,0,1,9"
    output = 1
    cpu = IntcodeCpu.new(input, 9)
    cpu.process
    expect(cpu.output).to eq(output)
  end

  it "tries test 5 0 = 0" do
    input = "3,12,6,12,15,1,13,14,13,4,13,99,-1,0,1,9"
    output = 0
    cpu = IntcodeCpu.new(input, 0)
    cpu.process
    expect(cpu.output).to eq(output)
  end

  it "tries test 5 1 = 1" do
    input = "3,12,6,12,15,1,13,14,13,4,13,99,-1,0,1,9"
    output = 1
    cpu = IntcodeCpu.new(input, 1)
    cpu.process
    expect(cpu.output).to eq(output)
  end

  it "tries test 6 >0 = 1" do
    input = "3,3,1105,-1,9,1101,0,0,12,4,12,99,1"
    output = 1
    cpu = IntcodeCpu.new(input, 3)
    cpu.process
    expect(cpu.output).to eq(output)
  end

  it "tries test 6 0 = 0" do
    input = "3,3,1105,-1,9,1101,0,0,12,4,12,99,1"
    output = 0
    cpu = IntcodeCpu.new(input, 0)
    cpu.process
    expect(cpu.output).to eq(output)
  end

  # The above example program uses an input instruction to ask for a single number.
  # The program will then output 999 if the input value is below 8, output 1000 if
  # the input value is equal to 8, or output 1001 if the input value is greater than 8.
  it "tries the deal 1" do
    input = "3,21,1008,21,8,20,1005,20,22,107,8,21,20,1006,20,31,1106,0,36,98,0,0,1002,21,125,20,4,20,1105,1,46,104,999,1105,1,46,1101,1000,1,20,4,20,1105,1,46,98,99"
    output = 999
    cpu = IntcodeCpu.new(input, 4)
    cpu.process
    expect(cpu.output).to eq(output)
  end

  it "tries the deal 2" do
    input = "3,21,1008,21,8,20,1005,20,22,107,8,21,20,1006,20,31,1106,0,36,98,0,0,1002,21,125,20,4,20,1105,1,46,104,999,1105,1,46,1101,1000,1,20,4,20,1105,1,46,98,99"
    output = 1000
    cpu = IntcodeCpu.new(input, 8)
    cpu.process
    expect(cpu.output).to eq(output)
  end

  it "tries the deal 3" do
    input = "3,21,1008,21,8,20,1005,20,22,107,8,21,20,1006,20,31,1106,0,36,98,0,0,1002,21,125,20,4,20,1105,1,46,104,999,1105,1,46,1101,1000,1,20,4,20,1105,1,46,98,99"
    output = 1001
    cpu = IntcodeCpu.new(input, 4372896)
    cpu.process
    expect(cpu.output).to eq(output)
  end

  it "tries day5.1" do
    input = File.open('day05_input.txt').read
    cpu = IntcodeCpu.new(input, 5)
    puts cpu.process
  end
end

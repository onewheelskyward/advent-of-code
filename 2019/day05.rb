require_relative 'intcode_cpu'

#input = "3,0,4,0,99"
#output = "1,0,4,0,99"
input = File.open('day05_input.txt').read
cpu = IntcodeCpu.new(input)
#expect(cpu.process).to eq(output)
puts cpu.process

# An Intcode program is a list of integers separated by commas (like 1,0,0,3,99).
# To run one, start by looking at the first integer (called position 0).
# Here, you will find an opcode - either 1, 2, or 99.
# The opcode indicates what to do; for example, 99 means that the program is finished and should immediately halt.
# Encountering an unknown opcode means something went wrong.

# Opcode 1 adds together numbers read from two positions and stores the result in a third position.
# The three integers immediately after the opcode tell you these three positions - the first two
# indicate the positions from which you should read the input values, and the third indicates the
# position at which the output should be stored.
#
# For example, if your Intcode computer encounters 1,10,20,30, it should read the values at
# positions 10 and 20, add those values, and then overwrite the value at position 30 with their sum.

# Opcode 2 works exactly like opcode 1, except it multiplies the two inputs instead of adding them.
# Again, the three integers after the opcode indicate where the inputs and outputs are, not their values.

# Once you're done processing an opcode, move to the next one by stepping forward 4 positions.

# DAY 5
#

class IntcodeCpu
  def log
    true
  end

  def initialize(input)
    puts "Input: #{input}"  if self.log
    @input = input.split(/,/).map(&:to_i)     # Compile the "program"
    @cur_pos = 0
  end

  def process

    pos_increment = 4

    loop do
      case @input[@cur_pos]
      when 1
        # Grab the values at the location stored in pos 1 and 2 and add
        calculated = @input[@input[@cur_pos + 1]] + @input[@input[@cur_pos + 2]]
        # store the value in the position at pos 3
        alter_pos = @input[@cur_pos + 3]
        @input[alter_pos] = calculated
        pos_increment = 4

      when 2
        # Grab the values at the location stored in pos 1 and 2 and multiply
        calculated = @input[@input[@cur_pos + 1]] * @input[@input[@cur_pos + 2]]
        # store the value in the position at pos 3
        alter_pos = @input[@cur_pos + 3]
        @input[alter_pos] = calculated
        pos_increment = 4

      when 99
        puts 'Exit code found'  if self.log
        input_str = @input.join ','
        puts "Output: #{input_str}"  if self.log
        return input_str
      end # case

      break if @cur_pos + pos_increment > @input.length  # Increment the input

      @cur_pos += pos_increment
    end

    input_str = input.join ','
    puts "Output: #{input_str}"  if self.log
    input_str
  end
end

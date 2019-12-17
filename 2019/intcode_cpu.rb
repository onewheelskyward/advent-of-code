# An Intcode program is a list of integers separated by commas (like 1,0,0,3,99).
# To run one, start by looking at the first integer (called position 0).
# Here, you will find an opcode - either 1, 2, or 99.
# The opcode indicates what to do; for example, 99 means that the program is finished and should immediately halt.
# Encountering an unknown opcode means something went wrong.



# Once you're done processing an opcode, move to the next one by stepping forward 4 positions.

# DAY 5
#

class IntcodeCpu
  def log(str)
    if true
      puts str
    end
  end

  def initialize(input, param = nil)
    self.log "Input: #{input}"
    @input = input.split(/,/).map(&:to_i)     # Compile the "program"
    @cur_pos = 0
    @param = param
  end

  def process

    pos_increment = 4

    loop do
      if @input[@cur_pos].to_s.length > 1
        command = @input[@cur_pos].to_s.rjust(5, "0")

        # It is important to remember that the instruction pointer should increase by the number
        # of values in the instruction after the instruction finishes. Because of the new
        # instructions, this amount is no longer always 4.
        pos_increment = @input[@cur_pos].to_s.length - 1

        self.log "Command #{command[3..4]}"
        self.log "param 1 #{command[2]}"
        self.log "param 2 #{command[1]}"
        self.log "param 3 #{command[0]}"

        operation = command[3..4].to_i
        @parm_modes = [command[2].to_i, command[1].to_i, command[0].to_i]
      elsif [1,2].include? @input[@cur_pos]
        operation = @input[@cur_pos]
        pos_increment = 4
      elsif [3,4].include? @input[@cur_pos]
        operation = @input[@cur_pos]
        pos_increment = 2
      end

      case operation
      when 1
        do_1

      when 2
        do_2

      when 3
        do_3

      when 4
        four_result = do_4

      when 99
        self.log 'Exit code found'
        input_str = @input.join ','
        self.log "Output: #{input_str}"
        #return @input[0]
        return input_str
      end # case

      break if @cur_pos + pos_increment > @input.length  # Increment the input

      @cur_pos += pos_increment
    end

    # alt exit, we ran out of input
    input_str = @input.join ','
    self.log "Output: #{input_str}"
    #@input[0]
    input_str
  end

  private

  # Opcode 1 adds together numbers read from two positions and stores the result in a third position.
  # The three integers immediately after the opcode tell you these three positions - the first two
  # indicate the positions from which you should read the input values, and the third indicates the
  # position at which the output should be stored.
  #
  # For example, if your Intcode computer encounters 1,10,20,30, it should read the values at
  # positions 10 and 20, add those values, and then overwrite the value at position 30 with their sum.
  def do_1
    input1, input2 = determine_inputs

    calculated = input1 + input2
    # store the value in the position at pos 3
    determine_output(calculated)
  end

  # Opcode 2 works exactly like opcode 1, except it multiplies the two inputs instead of adding them.
  # Again, the three integers after the opcode indicate where the inputs and outputs are, not their values.
  def do_2
    input1, input2 = determine_inputs

    calculated = input1 * input2
    # store the value in the position at pos 3
    determine_output(calculated)
  end

  def determine_output(calculated)
    if @parm_modes
      if @parm_modes[2] == 1
        @input[@cur_pos + 3] = calculated
      else
        alter_pos = @input[@cur_pos + 3]
        @input[alter_pos] = calculated
      end
    else
      alter_pos = @input[@cur_pos + 3]
      @input[alter_pos] = calculated
    end
  end

  def determine_inputs
    input1 = 0
    input2 = 0

    if @parm_modes
      if @parm_modes[0] == 1
        input1 = @input[@cur_pos + 1]
      else
        input1 = @input[@input[@cur_pos + 1]]
      end

      if @parm_modes[1] == 1
        input2 = @input[@cur_pos + 2]
      else
        input2 = @input[@input[@cur_pos + 2]]
      end
    else
      input1 = @input[@input[@cur_pos + 1]]
      input2 = @input[@input[@cur_pos + 2]]
    end
    return input1, input2

  end

  # Opcode 3 takes a single integer as input and saves it to the position given by its only parameter.
  # For example, the instruction 3,50 would take an input value and store it at address 50.
  def do_3
    # double dereference to find the proper location.
    @input[@input[@cur_pos + 1]] = @param
  end

  # Opcode 4 outputs the value of its only parameter. For example, the instruction 4,50 would output
  # the value at address 50.
  def do_4
    @input[@input[@cur_pos + 1]]
  end

end

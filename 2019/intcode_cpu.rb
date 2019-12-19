# An Intcode program is a list of integers separated by commas (like 1,0,0,3,99).
# To run one, start by looking at the first integer (called position 0).
# Here, you will find an opcode - either 1, 2, or 99.
# The opcode indicates what to do; for example, 99 means that the program is finished and should immediately halt.
# Encountering an unknown opcode means something went wrong.



# Once you're done processing an opcode, move to the next one by stepping forward 4 positions.

# DAY 5
#

class IntcodeCpu
  attr_reader :output

  def log(str)
    if false
      puts str
    end
  end

  def initialize(input, user_param = nil)
    self.log "Input: #{input}"
    @input = input.split(/,/).map(&:to_i)     # Compile the "program"
    @cur_pos = 0
    @user_param = user_param
  end

  def process

    pos_increment = 4

    loop do
      @parm_modes = []
      if @input[@cur_pos].to_s.length > 2
        command = @input[@cur_pos].to_s.rjust(5, "0")

        # It is important to remember that the instruction pointer should increase by the number
        # of values in the instruction after the instruction finishes. Because of the new
        # instructions, this amount is no longer always 4.
        #pos_increment = @input[@cur_pos].to_s.length - 1

        #self.log "Command #{command[3..4]} - params [#{command[2]}, #{command[1]}, #{command[0]}]"

        operation = command[3..4].to_i
        @parm_modes = [command[2].to_i, command[1].to_i, command[0].to_i]
      elsif [1,2,3,4,5,6,7,8,99].include? @input[@cur_pos]
        operation = @input[@cur_pos]
      else
        raise "Operation '#{@input[@cur_pos]}' not understood."
      end

      case operation
      when 1
        do_1
        pos_increment = 4

      when 2
        do_2
        pos_increment = 4

      when 3
        do_3
        pos_increment = 2

      when 4
        four_result = do_4
        pos_increment = 2

      when 5
        # jump-if-true, do_5 mutates the cur_pos, so don't increment it.
        if do_5
          pos_increment = 0
        else
          # Unless it returns false.
          pos_increment = 3
        end

      when 6
        if do_6
          pos_increment = 0
        else
          pos_increment = 3
        end

      when 7
        do_7
        pos_increment = 4

      when 8
        do_8
        pos_increment = 4

      when 99
        self.log 'Exit code found'
        input_str = @input.join ','
        self.log "Final: #{input_str}"
        #return @input[0]
        return input_str
      else
        raise "Oh me oh my what's a #{operation}?"
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
    self.log("Processing #{@input[@cur_pos..@cur_pos+3]}")
    input1, input2 = determine_inputs

    calculated = input1 + input2
    # store the value in the position at pos 3
    determine_output(calculated)
  end

  # Opcode 2 works exactly like opcode 1, except it multiplies the two inputs instead of adding them.
  # Again, the three integers after the opcode indicate where the inputs and outputs are, not their values.
  def do_2
    self.log("Processing #{@input[@cur_pos..@cur_pos+3]}")
    input1, input2 = determine_inputs

    calculated = input1 * input2
    # store the value in the position at pos 3
    determine_output(calculated)
  end

  # Opcode 3 takes a single integer as input and saves it to the position given by its only parameter.
  # For example, the instruction 3,50 would take an input value and store it at address 50.
  def do_3
    self.log("Processing #{@input[@cur_pos..@cur_pos+1]}")
    # double dereference to find the proper location.

    input = @user_param || gets.chomp.to_i
    index = @input[@cur_pos + 1]
    @input[index] = input
    self.log("Setting @input[#{index}] = #{input}")
  end

  # Opcode 4 outputs the value of its only parameter. For example, the instruction 4,50 would output
  # the value at address 50.
  def do_4
    self.log("Processing #{@input[@cur_pos..@cur_pos+1]}")
    self.log(@parm_modes)
    if @parm_modes[0] == 1
      result = @input[@cur_pos + 1]
    else
      result = @input[@input[@cur_pos + 1]]
    end
    @output = result
    puts "Output: #{result}"
  end

  # Opcode 5 is jump-if-true: if the first parameter is non-zero, it sets the instruction pointer to
  # the value from the second parameter. Otherwise, it does nothing.
  def do_5
    result = false
    if @parm_modes[0] == 1
      parm_1 = @input[@cur_pos+1]
    else
      parm_1 = @input[@input[@cur_pos+1]]
    end

    if parm_1 > 0
      result = true
      if @parm_modes[1] == 1
        @cur_pos = @input[@cur_pos+2]
      else
        @cur_pos = @input[@input[@cur_pos+2]]
      end
    end
    result
  end

  # Opcode 6 is jump-if-false: if the first parameter is zero, it sets the instruction pointer to
  # the value from the second parameter. Otherwise, it does nothing.
  def do_6
    result = false

    if @parm_modes[0] == 1
      parm_1 = @input[@cur_pos+1]
    else
      parm_1 = @input[@input[@cur_pos+1]]
    end

    if parm_1 == 0
      result = true
      if @parm_modes[1] == 1
        @cur_pos = @input[@cur_pos+2]
      else
        @cur_pos = @input[@input[@cur_pos+2]]
      end
    end

    result
  end

  # Opcode 7 is less than: if the first parameter is less than the second parameter, it stores 1
  # in the position given by the third parameter. Otherwise, it stores 0.
  def do_7
    self.log "do_7: @input[#{@input[@cur_pos+1]}] < @input[#{@input[@cur_pos+2]}]"
    input1, input2 = determine_inputs
    if input1 < input2
      self.log "do_7: #{input1}] < #{input2}]"
      @input[@input[@cur_pos+3]] = 1
    else
      self.log "do_7: #{input1}] !< #{input2}]"
      @input[@input[@cur_pos+3]] = 0
    end
  end

  # Opcode 8 is equals: if the first parameter is equal to the second parameter, it stores 1 in
  # the position given by the third parameter. Otherwise, it stores 0.
  def do_8
    self.log "do_8: @input[#{@input[@cur_pos+1]}] == @input[#{@input[@cur_pos+2]}]"
    input1, input2 = determine_inputs

    if input1 == input2
      @input[@input[@cur_pos+3]] = 1
    else
      @input[@input[@cur_pos+3]] = 0
    end
  end

  def determine_output(calculated)
    if @parm_modes
      if @parm_modes[2] == 1
        self.log "Setting @input[#{@cur_pos+3}] = #{calculated}"
        @input[@cur_pos + 3] = calculated
      else
        alter_pos = @input[@cur_pos + 3]
        @input[alter_pos] = calculated
        self.log "Setting @input[#{alter_pos}] = #{calculated}"
      end
    else
      alter_pos = @input[@cur_pos + 3]
      @input[alter_pos] = calculated
      self.log "Setting @input[#{alter_pos}] = #{calculated}"
    end
  end

  # Parameter mode vs immediate mode
  # if the mode == 1, grab the value in place.
  # If it is == 0, reference the field index in the field in question.
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

end

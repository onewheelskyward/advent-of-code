# --- Day 3: Gear Ratios ---
# You and the Elf eventually reach a gondola lift station; he says the gondola lift will take you up to the water
# source, but this is as far as he can bring you. You go inside.
#
# It doesn't take long to find the gondolas, but there seems to be a problem: they're not moving.
#
#   "Aaah!"
#
# You turn around to see a slightly-greasy Elf with a wrench and a look of surprise. "Sorry, I wasn't expecting anyone!
# The gondola lift isn't working right now; it'll still be a while before I can fix it." You offer to help.
#
# The engineer explains that an engine part seems to be missing from the engine, but nobody can figure out which one.
# If you can add up all the part numbers in the engine schematic, it should be easy to work out which part is missing.
#
# The engine schematic (your puzzle input) consists of a visual representation of the engine. There are lots of numbers
# and symbols you don't really understand, but apparently any number adjacent to a symbol, even diagonally, is a "part
# number" and should be included in your sum. (Periods (.) do not count as a symbol.)
#
# Here is an example engine schematic:
# 467..114..
# ...*......
# ..35..633.
# ......#...
# 617*......
# .....+.58.
# ..592.....
# ......755.
# ...$.*....
# .664.598..
# In this schematic, two numbers are not part numbers because they are not adjacent to a symbol: 114 (top right) and 58
# (middle right). Every other number is adjacent to a symbol and so is a part number; their sum is 4361.
#
# Of course, the actual engine schematic is much larger. What is the sum of all of the part numbers in the engine
# schematic?

class Day2
  def initialize(debug = true, run = false)
    @debug = debug
    @run = run
    @testdata = []
    # @testbdata = []
    @inputdata = []
    day = 'day3'

    File.open("#{day}-test.txt").each do |l|
      l.strip!
      puts "Adding #{l} to @testdata"  if @debug
      @testdata.push l
    end

    # File.open("#{day}b-test.txt").each do |l|
    #   l.stri
    #   puts "Addng #{l} to @testbdata"  if @@debug
    #   @testbdata.push l
    # end

    if @run
      File.open("#{day}-input.txt").each do |l|
        l.strip!
        puts "Adding #{l} to @inputdata"  if @debug
        @inputdata.push l
      end
    end
  end

  def run
    puts "running..."  if @debug
    test_maxes = process(@testdata)
    tot_up(test_maxes, {red: 12, green: 13, blue: 14})

    if @run
      input_maxes = process(@inputdata)
      tot_up(input_maxes, {red: 12, green: 13, blue: 14})
    end
  end

  def runb
    puts "running..."  if @debug
    test_maxes = process(@testdata)
    tot_up_b(test_maxes)

    if @run
      input_maxes = process(@inputdata)
      tot_up_b(input_maxes)
    end
  end

  def tot_up(game_maxes, constraints = {red: 0, green: 0, blue: 0})
  end

  def tot_up_b(game_maxes)
  end

  def process(data)
  end

end
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

class Day3
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

    if File.exist? "#{day}b-test.txt"
      File.open("#{day}b-test.txt").each do |l|
        l.stri
        puts "Addng #{l} to @testbdata"  if @@debug
        @testbdata.push l
      end
    end

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
    grid = process(@testdata)
    find_parts(grid)

    if @run
      input_grid = process(@inputdata)
      tot_up(input_grid)
    end
  end

  def runb
    puts "running..."  if @debug
    grid = process(@testdata)
    find_parts(grid)

    if @run
      input_grid = process(@inputdata)
      find_parts(input_grid)
    end
  end

  def find_parts(grid)
    grid.each_with_index do |grid_line, lindex|
      grid_line.each_with_index do |char, rindex|
        if char[/\d/]
          puts "#{char} at #{lindex},#{rindex}"
        end
      end
    end
  end

  def tot_up_b(game_maxes)
  end

  def process(data)
    grid = []
    # First generate the dimensional array
    data.each do |l|
      l.chomp!
      l_arr = l.split('')
      grid.push l_arr
    end
    grid
  end

end

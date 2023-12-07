# --- Day 1: Trebuchet?! ---
# Something is wrong with global snow production, and you've been selected to take a look.
# The Elves have even given you a map; on it, they've used stars to mark the top fifty locations
# that are likely to be having problems.
#
# You've been doing this long enough to know that to restore snow operations, you need to check
# all fifty stars by December 25th.
#
# Collect stars by solving puzzles. Two puzzles will be made available on each day in the Advent
# calendar; the second puzzle is unlocked when you complete the first. Each puzzle grants one star.
# Good luck!
#
# You try to ask why they can't just use a weather machine ("not powerful enough") and where they're
# even sending you ("the sky") and why your map looks mostly blank ("you sure ask a lot of questions")
# and hang on did you just say the sky ("of course, where do you think snow comes from") when you
# realize that the Elves are already loading you into a trebuchet ("please hold still, we need to strap you in").
#
# As they're making the final adjustments, they discover that their calibration document (your puzzle input) has
# been amended by a very young Elf who was apparently just excited to show off her art skills. Consequently, the
# Elves are having trouble reading the values on the document.

#   The newly-improved calibration document consists of lines of text; each line originally contained a specific
# calibration value that the Elves now need to recover. On each line, the calibration value can be found by combining
# the first digit and the last digit (in that order) to form a single two-digit number.
#
#   For example:
#
# 1abc2
# pqr3stu8vwx
# a1b2c3d4e5f
# treb7uchet
#
# In this example, the calibration values of these four lines are 12, 38, 15, and 77. Adding these together produces 142.
#
# Consider your entire calibration document. What is the sum of all of the calibration values?

class Day1lib
  @@debug = true
  @@run = true

  def initialize(testdata=[], testbdata=[], inputdata=[])
    @testdata = testdata
    @testbdata = testbdata
    @inputdata = inputdata

    File.open('day1-test.txt').each do |l|
      l.strip!
      puts "Adding #{l} to @testdata"  if @@debug
      @testdata.push l
    end

    File.open('day1b-test.txt').each do |l|
      l.strip!
      puts "Adding #{l} to @testbdata"  if @@debug
      @testbdata.push l
    end

    if @@run
      File.open('day1-input.txt').each do |l|
        l.strip!
        puts "Adding #{l} to @inputdata"  if @@debug
        @inputdata.push l
      end
    end
  end

  def run
    puts "running..."
    process(@testdata)
    process(@inputdata)  if @@run
  end

  def runb
    data = preprocess(@testbdata)
    process(data)

    if @@run
      data = preprocess(@inputdata)
      process(data)
    end

  end

  def preprocess(data)
    # -- Part Two ---
    # Your calculation isn't quite right. It looks like some of the digits are actually spelled out with letters: one,
    # two, three, four, five, six, seven, eight, and nine also count as valid "digits".
    #
    # Equipped with this new information, you now need to find the real first and last digit on each line. For example:
    #
    # two1nine
    # eightwothree
    # abcone2threexyz
    # xtwone3four
    # 4nineeightseven2
    # zoneight234
    # 7pqrstsixteen
    # In this example, the calibration values are 29, 83, 13, 24, 42, 14, and 76. Adding these together produces 281.
    #
    # What is the sum of all of the calibration values?
    words_hash = {'sixteen' => 16,
                  'oneight' => 18,
                  'threeight' => 38,
                  'fiveight' => 58,
                  'sevenine' => 79,
                  'eightwo' => 82,
                  'eighthree' => 83,
                  'twone' => 21,
                  'one' => 1,
                  'two' => 2,
                  'three' => 3,
                  'four' => 4,
                  'five' => 5,
                  'six' => 6,
                  'seven' => 7,
                  'eight' => 8,
                  'nine' => 9}
    altered = []
    data.each do |d|
      puts " pre: #{d}"  if @@debug
      modified_d = d
      words_hash.each do |k, v|
        # puts "modified_d = modified_d.gsub /#{k}/, #{v.to_s}"
        modified_d = modified_d.gsub /#{k}/, v.to_s
      end
      puts "post: #{modified_d}"  if @@debug
      altered.push modified_d
    end
    altered
  end

  def process(data)
    puts data.inspect  if @@debug
    total = 0
    data.each do |dataline|
      m = /\d/.match(dataline)
      # puts m.inspect
      d = dataline.scan(/\d/)
      # puts d.inspect
      num = d.first.to_s + d.last.to_s
      puts num  if @@debug
      total += num.to_i
    end
    puts "total: #{total}"
  end
end

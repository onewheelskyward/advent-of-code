#-- Part Two ---
# Your calculation isn't quite right. It looks like some of the digits are actually spelled out with letters: one, two, three, four, five, six, seven, eight, and nine also count as valid "digits".
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


class Day1blib
  @@debug = true
  @@run = true

  def initialize(testdata=[], inputdata=[])
    @testdata = testdata
    @inputdata = inputdata

    File.open('day1-test.txt').each do |l|
      l.strip!
      puts "Adding #{l} to @testdata"  if @@debug
      @testdata.push l
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

  def process(data)
    puts data.inspect  if @@debug
    total = 0
    data.each do |dataline|
      m = /\d/.match(dataline)
      puts m.inspect
      d = dataline.scan(/\d/)
      puts d.inspect
      num = d.first.to_s + d.last.to_s
      puts num
      total += num.to_i
    end
    puts "total: #{total}"
  end
end

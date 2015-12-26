input = File.read('day-1-input.txt')

floor = 0
first_basement = false

input.chars.each_with_index do |c, index|
  if '(' == c
    floor += 1
  end
  if ')' == c
    floor -= 1
  end
  if floor == -1 and not first_basement
    puts "Day 1.2 First basement index: #{index + 1}"
    first_basement = true
  end
end

puts "Day 1.1 floor: #{floor}"

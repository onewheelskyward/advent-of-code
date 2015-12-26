input = File.read('day-1-input.txt')

floor = 0

input.chars.each do |c|
  if '(' == c
    floor += 1
  end
  if ')' == c
    floor -= 1
  end
end

puts floor

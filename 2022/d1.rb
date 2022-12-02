elves = []
etemp = []

#sep the space-line delimited data into elves' sacks weights in calories
File.open('d1-data.txt').each do |l|
  l.strip!
  if l.to_i > 0
    etemp.push l.to_i
  else
    elves.push etemp
    etemp = []
  end
end

puts elves.inspect

elfcals = []

# Get total cal count per elf
elves.each do |elf|
  cals = elf.sum
  puts cals
  elfcals.push cals
end

puts "D1-1 Max cals: #{elfcals.max}"

# Sort the cal count for top three
ec_sorted = elfcals.sort.reverse

puts ec_sorted.inspect

puts "D1-2 Top 3: #{ec_sorted[0]},#{ec_sorted[1]},#{ec_sorted[2]}"

top_three = ec_sorted[0] + ec_sorted[1] + ec_sorted[2]

puts "Top 3 summed: #{top_three}"

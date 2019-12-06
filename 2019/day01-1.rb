masses = []

File.open('input.txt').each do |l|
  masses.push l.to_i
end


# divide by three, round down, and subtract 2.
#     For a mass of 12, divide by 3 and round down to get 4, then subtract 2 to get 2.
#     For a mass of 14, dividing by 3 and rounding down still yields 4, so the fuel required is also 2.
#     For a mass of 1969, the fuel required is 654.
#     For a mass of 100756, the fuel required is 33583.

def fuel_calc(m)
  (m / 3).floor - 2
end

# masses = [12, 14, 1969, 100756]

fuel = 0

masses.each do |m|
  f = fuel_calc m
  puts f
  fuel += f
end

puts "Total fuel #{fuel}"

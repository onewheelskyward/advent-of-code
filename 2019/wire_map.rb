# Log log log
def log
  false
end

# Determine the shortest sawtooth line between two points
def get_manhattan_dist(wire1, wire2)
  matches = []
  wire1.keys.each do |w1key|
    if wire2[w1key]
      matches.push w1key if w1key != [0, 0]
    end
  end

  puts matches.inspect if log

  manhattan_distances = []
  matches.each do |match|
    manhattan_distances.push match[0].abs + match[1].abs
  end

  manhattan_distances.min
end

# Turn the logo directions into coordinate point sets
def map_wire_coords(wiremap_str)
  wire_coords = [[0,0]]

  wiremap_str.split(/,/).each do |direction|
    dir = direction[/^\w/]
    num = direction[/\d+$/].to_i

    # Turn the U15 into +Y 15 and map each coordinate for intersection mapping.
    case dir
    when 'U'
      (1..num).each do
        wire_coords.push([wire_coords.last[0] + 1, wire_coords.last[1]])
      end
    when 'D'
      (1..num).each do
        wire_coords.push([wire_coords.last[0] - 1, wire_coords.last[1]])
      end
    when 'R'
      (1..num).each do
        wire_coords.push([wire_coords.last[0], wire_coords.last[1] + 1])
      end
    when 'L'
      (1..num).each do
        wire_coords.push([wire_coords.last[0], wire_coords.last[1] - 1])
      end
    end
  end

  # Rebuild the array into a hash for easier matching later.
  position = 1
  wire_coords_hash = {}
  wire_coords.each do |coord|
    wire_coords_hash[coord] = position  unless wire_coords_hash[coord]
    position += 1
  end

  wire_coords_hash
end

# Take the string input and turn it into a wire array.
def parse_wires(d)
  puts "Input: #{d}" if log

  wires = d.split(/\n/)

  wire1 = map_wire_coords wires[0]
  wire2 = map_wire_coords wires[1]

  puts wire1.inspect if log
  puts wire2.inspect if log

  return wire1, wire2
end

# Perform the mapping and then the
def wire_map_manhattan(d)
  wire1, wire2 = parse_wires(d)

  get_manhattan_dist(wire1, wire2)

  #puts "Output: #{input_str}"  if log
  #input_str
end

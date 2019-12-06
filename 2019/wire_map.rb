def map_wire_coords(wiremap_str)
  wire_coords = [[0,0]]

  wiremap_str.split(/,/).each do |direction|
    dir = direction[/^\w/]
    num = direction[/\d+$/].to_i
    #puts "#{dir} #{num}"

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

  wire_coords_hash = {}
  wire_coords.each do |coord|
    wire_coords_hash[coord] = 1
  end

  wire_coords_hash
end

def wire_map(d)
  log = false
  puts "Input: #{d}"  if log

  wires = d.split(/\n/)

  wire1 = map_wire_coords wires[0]
  wire2 = map_wire_coords wires[1]

  puts wire1.inspect  if log
  puts wire2.inspect  if log

  matches = []
  wire1.keys.each do |w1key|
    if wire2[w1key] == 1
      matches.push w1key  if w1key != [0,0]
    end
  end

  puts matches.inspect  if log

  mds = []
  matches.each do |match|
    mds.push match[0].abs + match[1].abs
  end

  mds.min

  #puts "Output: #{input_str}"  if log
  #input_str
end

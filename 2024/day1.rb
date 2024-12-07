class Day1
  def initialize(file)
    @data = []
    @data_left = []
    @data_right = []
    puts "Reading file #{file}"
    File.open(file).each do |l|
      l.strip!
      @data.push l
      (dl, dr) = l.split /\s+/
      @data_left.push dl.to_i
      @data_right.push dr.to_i
      # puts "#{dl} #{dr}"
    end
    @data_left.sort!
    @data_right.sort!
  end

  def run
    m = @data_left.count
    dist = 0
    for i in 0..m-1
      dist += (@data_right[i] - @data_left[i]).abs
    end
    puts "Distance = #{dist}"
  end

  def run2
    # Prep the similarity count hash
    data_hash = {}
    @data_right.each do |d|
      if data_hash[d]
        data_hash[d] += 1
      else
        data_hash[d] = 1
      end
    end
    # puts data_hash.inspect

    similarity_count = 0
    @data_left.each do |e|
      similarity_count += e * data_hash[e].to_i
    end
    puts "Similarity count: #{similarity_count}"
  end
end

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
end
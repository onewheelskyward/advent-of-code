class D3lib
  @@debug = false
  attr_reader :data

  # The list of items for each rucksack is given as characters all on a single line. A given
  # rucksack always has the same number of items in each of its two compartments, so the first
  # half of the characters represent items in the first compartment, while the second half of
  # the characters represent items in the second compartment.

  def initialize(file)
    @data = []
    @breakdown = []
    File.open(file).each do |l|
      l.strip!
      @data.push l
      # Split the data points into the component elements
      first, second = l.chars.each_slice(l.length / 2).map(&:join)
      puts "#{first} - #{second}"  if  @@debug
      # Store the elements for later
      @breakdown.push [first, second]
    end
  end

  def score
    overall_score = 0
    @breakdown.each do |f, s|
      # Find the matching char
      fchars = {}
      shared_char = ''
      f.chars.each do |c|
        fchars[c] = 1
      end
      s.chars.each do |c|
        if fchars[c] == 1
          puts "shared char between #{f} and #{s} is #{c}"  if @@debug
          shared_char = c
        end
      end

      # Score the char
      char_score = shared_char.ord
      if char_score <= 90
        char_score -= 38
      elsif char_score >= 97
        char_score -= 96
      end
      puts char_score  if @@debug
      overall_score += char_score
    end
    overall_score
  end
end

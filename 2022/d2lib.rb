class D2lib
  @@debug = false
  attr_reader :data

  @@plays = {'A': 1, 'B': 2, 'C': 3}
  @@response_scores = {'X': 1, 'Y': 2, 'Z': 3}


  def initialize(file)
    @data = []
    File.open(file).each do |l|
      @data.push l.strip
    end
  end

  # A for Rock, B for Paper, and C for Scissors. The second column--" Suddenly, the Elf is
  # called away to help with someone's tent.
  # The second column, you reason, must be what you should play in response:
  # X for Rock, Y for Paper, and Z for Scissors.
  #
  # The winner of the whole tournament is the player with the highest score. Your total
  # score is the sum of your scores for each round. The score for a single round is the
  # score for the shape you selected (1 for Rock, 2 for Paper, and 3 for Scissors) plus
  # the score for the outcome of the round (0 if you lost, 3 if the round was a draw, and 6 if you won).
  def score
    score = 0
    @data.each do |m|
      win = false
      draw = false
      (play, response) = m.upcase.split
      puts "#{play} -- #{response}"  if @@debug

      if (play == 'A' and response == 'Y') \
         or (play == 'B' and response == 'Z') \
         or (play == 'C' and response == 'X')

        win = true
      end

      # Match level scoring
      # .to_sym for symbol matching based on my weird hash implementation :D
      puts "#{@@plays[play.to_sym]} == #{@@response_scores[response.to_sym]}"  if @@debug
      if @@plays[play.to_sym] == @@response_scores[response.to_sym]
        draw = true
      end

      if win
        puts "Adding 6 to #{score}"  if @@debug
        score += 6
      end

      if draw
        puts "Adding 3 to #{score}"  if @@debug
        score += 3
      end

      puts "win: #{win}, draw: #{draw}"  if @@debug

      puts "Adding #{@@response_scores[response.to_sym].to_i} to #{score}"  if @@debug
      score += @@response_scores[response.to_sym].to_i

      puts "score: #{score}"  if @@debug
    end

    score
  end

  def score2b
    score = 0
    @data.each do |m|
      win = false
      draw = false
      (play, result) = m.upcase.split
      puts "#{play} -- #{response}"  if @@debug

      response = nil
      # response map
      win_map = {'A': 'Y', 'B': 'Z', 'C': 'X'}
      draw_map = {'A': 'X', 'B': 'Y', 'C': 'Z'}
      lose_map = {'A': 'Z', 'B': 'X', 'C': 'Y'}
      # Check for win scenarios
      case result
      when 'X'
        response = lose_map[play.to_sym]
      when 'Y'
        response = draw_map[play.to_sym]
      when 'Z'
        response = win_map[play.to_sym]
      end

      # Check for win scenarios
      if (play == 'A' and response == 'Y') \
         or (play == 'B' and response == 'Z') \
         or (play == 'C' and response == 'X')

        win = true
      end

      # Match level scoring
      # .to_sym for symbol matching based on my weird hash implementation :D
      puts "#{@@plays[play.to_sym]} == #{@@response_scores[response.to_sym]}"  if @@debug
      if @@plays[play.to_sym] == @@response_scores[response.to_sym]
        draw = true
      end

      if win
        puts "Adding 6 to #{score}"  if @@debug
        score += 6
      end

      if draw
        puts "Adding 3 to #{score}"  if @@debug
        score += 3
      end

      puts "win: #{win}, draw: #{draw}"  if @@debug

      puts "Adding #{@@response_scores[response.to_sym].to_i} to #{score}"  if @@debug
      score += @@response_scores[response.to_sym].to_i

      puts "score: #{score}"  if @@debug
    end

    score
  end

end

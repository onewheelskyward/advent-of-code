# --- Day 2: Cube Conundrum ---
# As you walk, the Elf shows you a small bag and some cubes which are either red, green, or blue. Each time you play
# this game, he will hide a secret number of cubes of each color in the bag, and your goal is to figure out information
# about the number of cubes.
#
# To get information, once a bag has been loaded with cubes, the Elf will reach into the bag, grab a handful of random
# cubes, show them to you, and then put them back in the bag. He'll do this a few times per game.
#
#   You play several games and record the information from each game (your puzzle input). Each game is listed with its
# ID number (like the 11 in Game 11: ...) followed by a semicolon-separated list of subsets of cubes that were revealed
# from the bag (like 3 red, 5 green, 4 blue).
#
#   For example, the record of a few games might look like this:
#
# Game 1: 3 blue, 4 red; 1 red, 2 green, 6 blue; 2 green
# Game 2: 1 blue, 2 green; 3 green, 4 blue, 1 red; 1 green, 1 blue
# Game 3: 8 green, 6 blue, 20 red; 5 blue, 4 red, 13 green; 5 green, 1 red
# Game 4: 1 green, 3 red, 6 blue; 3 green, 6 red; 3 green, 15 blue, 14 red
# Game 5: 6 red, 1 blue, 3 green; 2 blue, 1 red, 2 green
# In game 1, three sets of cubes are revealed from the bag (and then put back again). The first set is 3 blue cubes and
# 4 red cubes; the second set is 1 red cube, 2 green cubes, and 6 blue cubes; the third set is only 2 green cubes.
#
#   The Elf would first like to know which games would have been possible if the bag contained only 12 red cubes,
# 13 green cubes, and 14 blue cubes?
#
# In the example above, games 1, 2, and 5 would have been possible if the bag had been loaded with that configuration.
# However, game 3 would have been impossible because at one point the Elf showed you 20 red cubes at once; similarly,
# game 4 would also have been impossible because the Elf showed you 15 blue cubes at once. If you add up the IDs of the
# games that would have been possible, you get 8.
#
#   Determine which games would have been possible if the bag had been loaded with only 12 red cubes, 13 green cubes,
# and 14 blue cubes. What is the sum of the IDs of those games?


class Day2
  def initialize(debug = true, run = false)
    @debug = debug
    @run = run
    @testdata = []
    # @testbdata = []
    @inputdata = []
    day = 'day2'

    File.open("#{day}-test.txt").each do |l|
      l.strip!
      puts "Adding #{l} to @testdata"  if @debug
      @testdata.push l
    end

    # File.open("#{day}b-test.txt").each do |l|
    #   l.stri
    #   puts "Addng #{l} to @testbdata"  if @@debug
    #   @testbdata.push l
    # end

    if @run
      File.open("#{day}-input.txt").each do |l|
        l.strip!
        puts "Adding #{l} to @inputdata"  if @debug
        @inputdata.push l
      end
    end
  end

  def run
    puts "running..."  if @debug
    test_maxes = process(@testdata)
    tot_up(test_maxes, {red: 12, green: 13, blue: 14})

    if @run
      input_maxes = process(@inputdata)
      tot_up(input_maxes, {red: 12, green: 13, blue: 14})
    end
  end

  def runb
    puts "running..."  if @debug
    test_maxes = process(@testdata)
    tot_up_b(test_maxes)

    if @run
      input_maxes = process(@inputdata)
      tot_up_b(input_maxes)
    end
  end

  def tot_up(game_maxes, constraints = {red: 0, green: 0, blue: 0})
    possible_games_count = 0
    game_maxes.each do |game|
      game_colors = game[1]
      puts "Checking red #{game_colors[:red]} > #{constraints[:red]}, green #{game_colors[:green]} > #{constraints[:green]}, blue #{game_colors[:blue]} > #{constraints[:blue]}"  if @debug
      if game_colors[:red] > constraints[:red] or
        game_colors[:green] > constraints[:green] or
        game_colors[:blue] > constraints[:blue]
        puts "Couldn't have happened."
      else
        puts "Adding #{game[0].to_i} to possible_games_count"  if @debug
        possible_games_count += game[0].to_i
      end
    end
    puts "Day2a Total of game values possible: #{possible_games_count}"
  end

  # --- Part Two ---
  # The Elf says they've stopped producing snow because they aren't getting any water! He isn't sure why the water
  # stopped; however, he can show you how to get to the water source to check it out for yourself. It's just up ahead!
  #
  # As you continue your walk, the Elf poses a second question: in each game you played, what is the fewest number of
  # cubes of each color that could have been in the bag to make the game possible?
  #
  # Again consider the example games from earlier:
  #
  # Game 1: 3 blue, 4 red; 1 red, 2 green, 6 blue; 2 green
  # Game 2: 1 blue, 2 green; 3 green, 4 blue, 1 red; 1 green, 1 blue
  # Game 3: 8 green, 6 blue, 20 red; 5 blue, 4 red, 13 green; 5 green, 1 red
  # Game 4: 1 green, 3 red, 6 blue; 3 green, 6 red; 3 green, 15 blue, 14 red
  # Game 5: 6 red, 1 blue, 3 green; 2 blue, 1 red, 2 green
  #
  # In game 1, the game could have been played with as few as 4 red, 2 green, and 6 blue cubes.
  # If any color had even one fewer cube, the game would have been impossible.
  # Game 2 could have been played with a minimum of 1 red, 3 green, and 4 blue cubes.
  # Game 3 must have been played with at least 20 red, 13 green, and 6 blue cubes.
  # Game 4 required at least 14 red, 3 green, and 15 blue cubes.
  # Game 5 needed no fewer than 6 red, 3 green, and 2 blue cubes in the bag.
  # The power of a set of cubes is equal to the numbers of red, green, and blue cubes multiplied together. The power
  # of the minimum set of cubes in game 1 is 48. In games 2-5 it was 12, 1560, 630, and 36, respectively. Adding up
  # these five powers produces the sum 2286.
  #
  # For each game, find the minimum set of cubes that must have been present.
  # What is the sum of the power of these sets?

  def tot_up_b(game_maxes)
    total_power_score = 0
    # The maxes array is also the min number of cubes
    game_maxes.each do |game|
      game_colors = game[1]
      game_power = game_colors[:red] * game_colors[:green] * game_colors[:blue]
      total_power_score += game_power
      puts "game_power = #{game_colors[:red]} * #{game_colors[:green]} * #{game_colors[:blue]}"  if @debug
      puts "total_power_score: #{total_power_score}"
    end
  end

  def process(data)
    game_maxes = {}

    # Iterate the games
    data.each do |l|
      l.chomp!
      puts l  if @debug
      # Split Game 1: and game data
      (game, cubes) = l.split /:\s+/
      m = /Game (\d+)/.match game
      game = m[1].to_s

      # init array to store max values
      game_maxes[game] = {}
      game_maxes[game][:red] = 0
      game_maxes[game][:blue] = 0
      game_maxes[game][:green] = 0

      # Split the bag pull results per game
      cubes.split(/; /).each do |viewing|
        puts viewing  if @debug
        # Split the pull into component colors
        viewing.split(/,/).each do |molecule|
          # Naamed regex for nice readability
          match = /(?<count>\d+)\s+(?<color>\w+)/.match(molecule)

          # If the number for a color is bigger, plop it in!
          if match[:count].to_i > game_maxes[game][match[:color].to_sym].to_i
            game_maxes[game][match[:color].to_sym] = match[:count].to_i
          end
        end
      end
    end
    game_maxes
  end

end

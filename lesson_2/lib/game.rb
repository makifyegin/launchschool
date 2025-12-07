class Game
  attr_accessor :winner, :loser

  RULES = {
    "rock"     => %w[scissors lizard],
    "paper"    => %w[rock spock],
    "scissors" => %w[paper lizard],
    "lizard"   => %w[spock paper],
    "spock"    => %w[scissors rock]
  }

  def initialize
    @winner = nil
    @loser  = nil
    puts "Can you please type your name:"
    name = gets.chomp
    @human = Player.new(name: name, type: :human)
    @ai    = Player.new(name: "Bot-#{SecureRandom.alphanumeric(6)}", type: :ai)
  end


  # starts the game loop, calls play_round, asks "play again?"
  def start
    # TODO: set up players, main loop, call play_round repeatedly
    loop do
      play_round
      puts "#{@human.choice} and #{@ai.choice}"
      break if @human.score == 3 || @ai.score == 3
    end

  end

  # end the game, display final results
  def finish
    # TODO: show final scores, thank the player, etc.
    puts "Final Score:\n#{@human.name} is #{@human.score} and #{@ai.name} score is #{@ai.score}!!!"
    puts 'Thanks for playing!'
  end

  # play a single round: ask players to choose, decide winner, update scores
  def play_round
    # TODO:
    # 1. ask human to choose (or call player.choose!)
    @human.choose!
    # 2. ask ai to choose
    @ai.choose!

    result = decide_winner(@human.choice, @ai.choice)
    # 3. decide winner (use a rules helper)

    @winner = result
    if @winner
      @winner.score += 1
      @loser = [@human, @ai].find { |p| p != @winner } if @winner
      puts "\n"
      puts "#{@winner.name}:#{@winner.score}"
      puts "#{@loser.name}:#{@loser.score}"
    end


    # 4. set @winner and @loser   appropriately
    # 5. update scores
    # 6. display round results
  end



  def decide_winner(human_choice, ai_choice)
    return nil if human_choice == ai_choice
    return RULES[human_choice].include?(ai_choice) ? @human : @ai
  end
end


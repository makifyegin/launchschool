

class Player
  attr_reader  :name, :type, :choice   # getters
  attr_accessor  :score
  def initialize(name:, type:)
    raise ArgumentError, 'type must be :human or :ai' unless %i[human ai].include?(type)

    @name = name
    @type = type
    @score = 0
    @choice=nil
  end

  def reset_choice!
    @choice = nil
  end

  def choose!
    if type == :ai
      @choice = VALID_CHOICES.sample
    else
      loop do
        puts "Choose one: #{VALID_CHOICES.join(', ')}"
        input = Kernel.gets.chomp.downcase.strip
        if VALID_CHOICES.include?(input)
          @choice = input
          break
        else
          puts "That's not a valid choice.Please type #{VALID_CHOICES.join(', ')}"
        end
      end
    end
    @choice
  end

end

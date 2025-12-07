require 'securerandom'
require_relative 'lib/player'
require_relative 'lib/game'

VALID_CHOICES = %w[rock paper scissors lizard spock].freeze


first_game = Game.new
first_game.start
first_game.finish

# Development

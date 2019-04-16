require 'pry'
require 'bundler'
Bundler.require

require_relative 'lib/player'
require_relative 'lib/game'

game = Game.new("Wolverine")

binding.pry
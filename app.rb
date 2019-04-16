require 'pry'
require 'bundler'
Bundler.require

require_relative 'lib/player'
require_relative 'lib/game'



player1 = Player.new("José")

binding.pry
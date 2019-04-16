require 'pry'
require 'bundler'
Bundler.require

require_relative 'lib/player'
require_relative 'lib/game'



joueur1 = Player.new("José")
joueur2 = Player.new("Josiane")

binding.pry
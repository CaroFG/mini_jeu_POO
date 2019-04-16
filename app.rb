require 'pry'
require 'bundler'
Bundler.require

require_relative 'lib/player'
require_relative 'lib/game'


player1= Player.new("José")
player2 = Player.new("Josiane")

puts "----- Welcome to the fight ! ----- \n\n"

puts "A ma gauche, #{player1.name}!"
puts "#{player1.show_state} \n"

puts "----------------------------------\n\n"

puts "A ma droite, #{player2.name}!"
puts "#{player2.show_state} \n"

puts "----------------------------------\n\n"

puts "Maintenant que vous connaissez l'état de chaque joueur,\nque le combat commence!\n\n"

puts "============= FIGHT! =============\n\n"

while player1.life_points > 0 && player2.life_points > 0

player2.attacks(player1)

puts "----------------------------------"

if player1.life_points <= 0
	break
end

player1.attacks(player2)

puts "----------------------------------"

end

puts "Le combat est terminé!"


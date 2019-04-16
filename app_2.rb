require 'pry'
require 'bundler'
Bundler.require

require_relative 'lib/player'
require_relative 'lib/game'


puts "-------------------------------------------------"
puts "|Bienvenue sur 'ILS VEULENT TOUS MA POO' !      |"
puts "|Le but du jeu est d'être le dernier survivant !|"
puts "-------------------------------------------------"

puts "Quel est ton prénom ?"
print ">"
nom = gets.chomp

human = HumanPlayer.new(nom)
player1 = Player.new("José")
player2 = Player.new("Josiane")

puts "----- Welcome to the fight ! ----- \n\n"

puts "A ma gauche, #{player1.name} et #{player2.name}!"
puts "#{player1.show_state} \n"

puts "----------------------------------\n\n"

puts "A ma droite, #{human.name}!"
puts "#{player2.show_state} \n"

puts "----------------------------------\n\n"

puts "Maintenant que vous connaissez l'état de chaque joueur,\nque le combat commence!\n\n"
puts "============= FIGHT! =============\n\n"

while (player1.life_points > 0 || player2.life_points > 0) && human.life_points > 0

	puts human.show_state

	puts "Quelle action veux-tu effectuer ?\n\n"

	puts "a - chercher une meilleure arme"
	puts "s - chercher à se soigner\n\n" 

	puts "attaquer un joueur en vue :"
	puts "0 - #{player2.show_state}" 
	puts "1 - #{player1.show_state}\n\n"

	choix = gets.to_s

	if choix == "a"
		human.search_weapon
	elsif choix == "b"
		human.search_health_pack
	elsif choix == "0"
		human.attacks(player1)
	elsif choix == "1"
		human.attacks(player2)
	end	
	
	puts "Les autres joueurs t'attaquent !"


	enemies = Array.new
	enemies.push(player1,player2)
	enemies.each do |enemy|
		if enemy.life_points > 0
			enemy.attacks(human)
		end
	end
end	
puts "La partie est finie"

if human.life_points < 0
	puts "LOSER !!! T'es un perdant!"
else
	puts "BRAVO !!! Tu as gagné !!!"
end
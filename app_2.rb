require 'pry'
require 'bundler'
Bundler.require

require_relative 'lib/player'
require_relative 'lib/game'

# On affiche l'introduction du jeu
puts "-------------------------------------------------"
puts "|Bienvenue sur 'ILS VEULENT TOUS MA POO' !      |"
puts "|Le but du jeu est d'être le dernier survivant !|"
puts "-------------------------------------------------"

# On demande l'utilisateur son prénom
puts "Quel est ton prénom ?"
print ">"
nom = gets.chomp

# Le prénom de l'utilisateur devient le nom du joueur HumanPlayer
human = HumanPlayer.new(nom)



# On stock les ennemis dans un nouvel array
enemies = Array.new

# 2 nouveaux ennemis sont créés, et on les met dans l'array
enemies.push(Player.new("José"))
enemies.push(Player.new("Josiane"))

# Introduction des participants
puts "\n----- Welcome to the fight ! ----- \n"

puts "A ma gauche, #{enemies[0].name} et #{enemies[1].name}!"
puts "#{enemies[0].show_state} \n"
puts "#{enemies[1].show_state} \n"

puts "----------------------------------\n"

puts "A ma droite, #{human.name}!"
puts "#{human.show_state} \n"

puts "----------------------------------\n"

puts "Maintenant que vous connaissez l'état de chaque joueur,\nque le combat commence!\n\n"

puts "Si vous êtes prêt à commencer, appuiez sur entrée"

gets.chomp

puts "============= FAITES UN CHOIX! =============\n\n"

# Début du combat, et début de la boucle où l'utilisateur fait un choix puis les ennemis attaquent
while (enemies[0].life_points > 0 || enemies[1].life_points > 0) && human.life_points > 0

	# On affiche l'état du joueur
	puts human.show_state

	# On propose plusieurs choix au joueur
	puts "\nQuelle action voulez-vous effectuer ?"
	puts "----------------------------------\n"
	puts "a - Chercher une meilleure arme"
	puts "s - Chercher à se soigner" 
	puts "----------------------------------\n"
	puts "Attaquer un joueur en vue :"

	#A chaque tour, on affiche bien l'état des ennemis
	puts "0 - #{enemies[0].show_state}" 
	puts "1 - #{enemies[1].show_state}"
	puts "----------------------------------\n"

	# On récupère le choix du joueur
	print "> "
	choix = gets.chomp
	puts "----------------------------------\n"

	# On lance la méthode appropriée en fonction du choix de l'utilisateur
	if choix == "a"
		human.search_weapon
	elsif choix == "s"
		human.search_health_pack
	elsif choix == "0"
		human.attacks(enemies[0])
	elsif choix == "1"
		human.attacks(enemies[1])
	end	
	
	# Si au moins encore un ennemi est toujours vivant, il(s) attaque(nt)
	if (enemies[0].life_points > 0 || enemies[1].life_points > 0) && human.life_points > 0
	puts "\nLes autres joueurs vous attaquent !\n\n"

	# C'est le tour des ennemis d'attaquer.
	# On fait le tour de l'array pour faire attaquer les ennemis vivants.
		enemies.each do |enemy|
			if enemy.life_points > 0
				enemy.attacks(human)
				puts = "" # Pour rajouter un saut de ligne
			end
	end
end

# Fin de la boucle while
end	

puts "La partie est finie"

# Si le joueur est mort, on lui dit qu'il a perdu.
# Si il est vivant, on lui dit Bravo.
if human.life_points < 0
	puts "LOSER !!! Vous avez perdu!"
else
	puts "BRAVO !!! Vous avez gagné !!!"
end
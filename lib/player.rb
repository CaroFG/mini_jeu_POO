class Player
	attr_accessor :name, :life_points

	# Tous les joueurs comments avec un nom et 10 points de vie
	def initialize(name)
		@name = name
		@life_points = 10
	end

	# Méthode pour afficher les points de vie du personnage
	def show_state
		return puts "#{@name} a #{@life_points} points de vie." 
	end

	# Méthode pour obtenir un nombre de dégats au hasard
	def compute_damage
		return rand(1..6)
	end

	# Methode pour les points de dégat
	def gets_damage(dmg)
		# On soustrait les dégats aux points de vie
		@life_points -= dmg

	end

	# Méthode pour qu'un joueur en attaque un autre
	def attacks(attacked_player)
		# On récupère les dégats aléatoires grâce à compute_damage
		damage = compute_damage
		# On dit à l'utilisateur qui attaque qui
		puts "#{@name} attaque #{attacked_player.name}"
		# On enlève les dégats aux points de vie et on vérifie si le perso est mort grâce à gets_damage
		attacked_player.gets_damage(damage)
		# On affiche le résultat
		puts "Il/elle a infligé #{damage} points de dégats à #{attacked_player.name}"

		# Si les points de vie sont inférieurs ou égal à 0, le personnage est mort
		# et on prévient l'utilisateur
		if attacked_player.life_points <= 0
			puts "#{attacked_player.name} est mort(e)"
		end	
	end


end
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

	def compute_damage
		return rand(1..6)
	end

	# Methode pour les points de dégat
	def gets_damage(dmg)
		# On soustrait les dégats aux points de vie
		@life_points -= dmg
		# Si les points de vie sont inférieurs ou égal à 0, le personnage est mort
		# et on prévient l'utilisateur
		if @life_points	<= 0 
			puts "#{@name} est mort."
		end	
	end

	# Méthode pour qu'un joueur en attaque un autre
	def attacks(player2)
		damage = compute_damage
		puts "#{@name} attaque #{player2.name}"
		player2.gets_damage(damage)
		puts "#{@name} inflige #{damage} points de dégats à #{player2.name}"
	end

		# Méthode pour obtenir un nombre de dégats au hasard
	

end
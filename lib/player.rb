class Player
	attr_accessor :name, :life_points


	# Tous les joueurs comments avec un nom et 10 points de vie
	def initialize(name)
		@name = name
		@life_points = 10
	end

	# Méthode pour afficher les points de vie du personnage
	def show_state
		return "#{@name} a #{@life_points} points de vie" 
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
		puts "Il/elle a infligé #{damage} points de dégats à #{attacked_player.name}\n\n"

		# Si les points de vie sont inférieurs ou égal à 0, le personnage est mort
		# et on prévient l'utilisateur
		if attacked_player.life_points <= 0
			puts "#{attacked_player.name} est mort(e)"
		end	
	end


end

# HumanPlay hérite des propriétés de Player
class HumanPlayer < Player
	# On ajoute l'attribut weapon_level
	attr_accessor :weapon_level

	# On définit les changements, le nom fonctionne comme pour Player,
	# mais cette fois on a une arme weapon_level de niveau 1,
	# et le joueur humain commence avec 100 point de vie.
	def initialize(name)
		super(name)
		@weapon_level = 1
		@life_points = 100	
	end


	def show_state
		# On modifie le show_state pour ajouter le niveau de l'arme
		return "#{@name} a #{@life_points} points de vie et possède une arme de niveau #{@weapon_level}" 
	end	

	def compute_damage
		# On multiplie le niveau de l'arme pour avoir un bonus de dégats
		rand(1..6) * @weapon_level
	end

	# Méthode pour chercher une arme et augmenter le bonus de dégats
	def search_weapon
		# On trouve au hasard une arme de niveau 1 à 6
		weapon_found = rand(1..6)
		puts "Bravo, vous avez trouvé une arme de niveau #{weapon_found}"

		# Si l'arme trouvée est d'un niveau supérieur à celle qu'on à, on la garde
		# et applique son bonus de dégats
		if weapon_found > @weapon_level
			@weapon_level = weapon_found
			puts "Yeah, cette nouvelle arme est meilleure, je la garde"
		else
			puts "Mince, cette arme est pourrie, je ne la garde pas"
		end 
	end

	# Méthode pour chercher des health packs
	def search_health_pack
		# On fait un lancer de dé
		roll_dice = rand(1..6)
		# Si le résultat vaut 1, on ne trouve rien, s'il vaut entre 2 et 5 le joueur
		# trouve un health pack de +50 points de vie, si le résultat vaut 6,
		# un de +80 points de vie.
		if roll_dice == 1 
			puts "Dommage, vous n'avez rien trouvé"

		elsif roll_dice >= 2 && roll_dice <= 5 
			puts "Bravo vous avez trouvé un pack +50 points de vie"
			if (@life_points + 50) > 100 
				# Si le health pack fait dépasser les points de vie max (100),
				# on repasse lesp oints de vie à 100.
				@life_points = 100
			else @life_points += 50
			end

		elsif roll_dice == 6
			puts "Excellent, vous avez trouvé un super pack +80 points de vie"
			if (@life_points + 80) > 100
				@life_points = 100
			else @life_points += 80
			end
		end
	end
end
class Game

	attr_accessor :human_player, :enemies

	def initialize(name_human_player)
		@human_player = HumanPlayer.new(name_human_player)
		@enemies = [joey = Player.new("Joey"), jill = Player.new("Jill"), jack = Player.new("Jack"), jane = Player.new("Jane")] 
	end

	def kill_player(player_to_kill)
		@enemies.delete(player_to_kill.downcase)
	end

	def is_still_ongoing?
		if @human_player.life_points > 0 && @enemies.size > 0
			return true
		else
			return false
		end
	end

	def show_players
		puts @human_player.show_state
		puts "Il reste #{@enemies.size} ennemis en vie"
	end 

	def menu
		puts "\nQuelle action voulez-vous effectuer ?"
		puts "----------------------------------\n"
		puts "a - Chercher une meilleure arme"
		puts "s - Chercher à se soigner" 
		puts "----------------------------------\n"
		puts "Attaquer un joueur en vue :"

	#A chaque tour, on affiche bien l'état des ennemis, l'index va correspondre au choix
	
	@enemies.each_with_index do |enemy, index|
		puts "#{index} - #{enemy.show_state}" 
	end
	puts "----------------------------------\n"
	# On récupère le choix du joueur
	print "> "
	user_choice = gets.chomp.to_s
	puts "----------------------------------\n"
	menu_choice(user_choice)
end

def menu_choice(choice)
	if choice == "a"
		human_player.search_weapon
	elsif choice == "s"
		human_player.search_health_pack
	end
	@enemies.each_index do |index|
		index_string = index.to_s
		if choice == index_string
			human_player.attacks(enemies[index])
		end
	end	
end

def enemies_attack(attacked_player)
		# On récupère les dégats aléatoires grâce à compute_damage
		damage = compute_damage
		# On dit à l'utilisateur qui attaque qui
		puts "#{@name} attaque #{human_player.name}"
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
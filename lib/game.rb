class Game

	attr_accessor :human_player, :enemies

	def initialize(name_human_player)
		@human_player = HumanPlayer.new(name_human_player)
		@enemies = [joey = Player.new("Joey"), jill = Player.new("Jill"), jack = Player.new("Jack"), jane = Player.new("Jane")] 
	end

	def kill_player(player_to_kill)
		@enemies.delete(player_to_kill)
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
			if enemies[index].life_points <= 0
				kill_player(enemies[index])
			end
		end
	end	
end

def enemies_attack
		enemies.each do |enemy|
			enemy.attacks(human_player)
		end
end	

def end


end	


end
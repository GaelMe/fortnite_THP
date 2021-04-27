require 'bundler'
Bundler.require

require_relative 'lib/game'
require_relative 'lib/player'


player1 = Player.new("Josiane")
player2 = Player.new("José")

puts "Passons à la phase d'attaque "

while player1.life_points > 0 && player2.life_points > 0

puts "voici l'etat de chaque joueur"
puts player1.show_state
puts player2.show_state

player1.attacks(player2) 
puts " "
break if player2.life_points <= 0
puts " "
player2.attacks(player1)
puts " "
end

binding.pry 

puts "End of file"


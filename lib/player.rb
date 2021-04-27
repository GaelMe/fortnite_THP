class Player 
    #variable de classe attribué a un joueur
    attr_accessor :name, :life_points

    def initialize(player_name)
      @name = player_name
      @life_points = 10
    end

    def show_state
        puts "#{@name} dispose de #{@life_points} de PV"
    end


    # # Affichage des pv quand le joueur reçoit une attaque
    def gets_damage(damage_received)
        @life_points -= damage_received
        if @life_points <= 0
            puts "le joueur #{@name} est capoute"
        end
    end

    # # jet d'un dé pour avoir un nombre aléatoire entre 1 et 6
    def compute_damage
        return rand(1..6)
    end

    def attacks(player2)
        dice = compute_damage
        puts "#{self.name} attaque #{player2.name}"
        puts "Il lui inflige #{dice} point de dommages"
        player2.gets_damage(dice)
    end
end

class HumanPlayer < Player
    attr_accessor :weapon_level

    def initialize(name_input)
        @name = name_input
        @life_points = 100
        @weapon_level = 1
    end

    def show_state
        puts "#{@name} a #{@life_points} points de vie et une arme de niveau #{@weapon_level}"
    end

    def compute_damage
        return rand(1..6) * weapon_level
    end

    def search_weapon
        new_weapon = rand(1..6)
        puts "tu as trouvé une arme de niveau #{new_weapon}"
        if new_weapon > @weapon_level
            @weapon_level = new_weapon
            puts 'Ta nouvelle arme est vachement plus puissante, on la garde'
        else
            puts 'Ton arme actuelle est plus puissante, on jette, pas la place de tout prendre'
        end
    end

    def search_health_pack
        health_pack = rand(1..6)
        case health_pack
        when 1
            puts "Tu n'as rien trouvé ... "
        when 2..5
            if @life_points <= 50
                @life_points += 50
            else 
                @life_points = 100
            end
        when 6
            if @life_points <= 20
                @life_points += 80
            else
                @life_points = 100
            end
            puts "Waow, tu as prouvé un pack de +80 points de vie !"
        end
    end
end

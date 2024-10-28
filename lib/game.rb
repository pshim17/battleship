require './spec/spec_helper'

class Game
    def start
        puts "Welcome to BATTLESHIP"
        prompt_user
    end

    def prompt_user
        puts "Enter p to play. Enter q to quit"
        user_input = gets.chomp
        user_input
        
        if user_input == 'p'
            play_game
        elsif user_input == 'q'
            puts "Good bye!"
            exit!
        else 
            puts "Invalid input! Please enter p to play or enter q to quit"
            prompt_user
        end
    end

    def play_game
        puts "game is starting"
    end

    def player_ship_placement
        puts "I have laid out my ships on the grid."
        puts "You now need to lay out yout two ships"
        puts "The Cruiser is three units long and the Submarine is two units long"
        puts "1 2 3 4"
        puts


    end
end
require './spec/spec_helper'

class Game
    def start
        puts "Welcome to BATTLESHIP"
        prompt_user
    end

    def prompt_user
        puts "Enter p to play. Enter q to quit"
        user_input = gets.chomp

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
end
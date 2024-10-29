require './spec/spec_helper'

class Game
    attr_reader :player_board, 
                :computer_board, 
                :player_cruiser, 
                :player_submarine, 
                :computer_cruiser, 
                :computer_submarine,
                :current_player

    def initialize
        @player_board = Board.new
        @computer_board = Board.new
        @player_cruiser = Ship.new("Cruiser", 3)
        @player_submarine = Ship.new("Submarine", 2)
        @computer_cruiser = Ship.new("Cruiser", 3)
        @computer_submarine = Ship.new("Submarine", 2)
        @current_player = :player
    end

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
        place_cpu_ship
        player_ship_placement
        loop do
            turn
            break if game_over?
        end
    end

    def place_cpu_ship
        cruiser_coordinates = @computer_cruiser.valid_coordinate?(@computer_cruiser)
        @computer_board.place(@computer_cruiser, cruiser_coordinates)

        submarine_coordinates = valid_coordinate?(@computer_submarine)
        @computer_board.place(@computer_submarine, submarine_coordinates)

    end

    def player_ship_placement
        puts "I have laid out my ships on the grid."
        puts "You now need to lay out your two ships"
        puts "The Cruiser is three units long and the Submarine is two units long"
        puts @player_board.render(true)

        loop do
            puts  "Enter the squares for the Cruiser (3 spaces):"
            puts ">"
            cruiser_input = gets.chomp.split
            if @player_board.valid_placement?(@player_cruiser, cruiser_input)
                @player_board.place(@player_cruiser, cruiser_input)
                puts @player_board.render(true)
                break
            else
                puts "Those are invalid coordinates. Please try again:"
            end
        end
        loop do
            puts "Enter the squares for the Submarine (2 spaces):"
            puts ">"
            submarine_input = gets.chomp.split
            if @player_board.valid_placement?(@player_submarine, submarine_input)
                @player_board.place(@player_submarine, submarine_input)
                @player_board.render
                puts @player_board.render(true)
                break
            else
                puts "Those are invalid coordinates. Please try again:"
            end
        end
    end

    def Turn
        p_board = @current_player == 
    end
end
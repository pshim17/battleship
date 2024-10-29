require './spec/spec_helper'

class Game
    attr_reader :player_board, 
                :computer_board, 
                :player_cruiser, 
                :player_submarine, 
                :computer_cruiser, 
                :computer_submarine

    def initialize
        @player_board = Board.new
        @computer_board = Board.new
        @player_cruiser = Ship.new("Cruiser", 3)
        @player_submarine = Ship.new("Submarine", 2)
        @computer_cruiser = Ship.new("Cruiser", 3)
        @computer_submarine = Ship.new("Submarine", 2)
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
    end

    def place_cpu_ship
        ships = [@computer_cruiser, @computer_submarine]
        ships.each do |ship|
            placed = false

            while placed == false
                letters = ["A", "B", "C", "D"]
                numbers = [1, 2, 3, 4]
                random_letter = letters.sample
                random_number = numbers.sample
                starting_point = "#{random_letter}#{random_number}"

                orientation = ["horizontal", "vertical"].sample

                coordinates = ship_coordinates(starting_point, orientation, ship.length)

                if @computer_board.valid_placement?(ship, coordinates)
                    @computer_board.place(ship, coordinates)
                    placed = true
                end
            end
        end
    end

    def ship_coordinates(starting_point, orientation, length)
        coordinates = []
        letter = starting_point[0]
        number = starting_point[1].to_i

        (0...length).each do |num|
            #starting point: A1 => A2, A3
            if orientation == "horizontal"
                coordinates << "#{letter}#{number + num}"
            #starting point: A1 => B1, C1    
            elsif orientation == "vertical"
                next_letter = (letter.ord + num).chr
                coordinates << "#{next_letter}#{number}"
            end
        end
        coordinates
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
end
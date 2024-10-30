require 'spec_helper'

RSpec.describe Game do
  before (:each) do
    @game = Game.new
    @computer_board = @game.computer_board
    @computer_cruiser = @game.computer_cruiser
  end
  describe "place_cpu_ships" do
    it "places computers ships at random on computer board" do
      @game.place_cpu_ship
   
     cruiser_on_board = @computer_board.cells.any? do |cell|
        #binding.pry
        cell.last.ship == @computer_cruiser 
          
      end
      expect(cruiser_on_board).to eq(true)

    end
    it "places computers ships at random on computer board" do
      @game.place_cpu_ship
   
     submarine_on_board = @computer_board.cells.any? do |cell|
        #binding.pry
        cell.last.ship == @computer_submarine
          
      end
      expect(submarine_on_board).to eq(true)
    end
  end
end
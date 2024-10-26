require 'spec_helper'

RSpec.describe Board do
  before(:each) do
    @board = Board.new
  end
  describe "intiialize" do
    it "starts board off with cells" do
      expect(@board.cells).to be_a(Hash)
      expect(@board.cells.keys.size).to eq(16)
      expect(@board.cells.values.size).to eq(16)
      expect(@board.cells["A1"]).to be_a(Cell)
      expect(@board.cells["A5"]).to eq(nil)
    end
  end

  describe "valid_coordinate?" do
    it "tells if a cell is a valid coordinate" do
      expect(@board.valid_coordinate?("A1")).to eq(true)
      expect(@board.valid_coordinate?("D4")).to eq(true)
      expect(@board.valid_coordinate?("A5")).to eq(false)
      expect(@board.valid_coordinate?("E1")).to eq(false)
      expect(@board.valid_coordinate?("A22")).to eq(false)

    end
  end
      
end
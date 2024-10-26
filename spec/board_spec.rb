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

  describe ""
      
end
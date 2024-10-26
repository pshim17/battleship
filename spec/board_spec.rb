require 'rspec'
require './lib/ship'
require './lib/cell'
require './lib/board'

RSpec.describe Board do
  before(:each) do
    @board = Board.new
  end
  describe "intiialize" do
    it "starts board off with cells" do
      expect(@board.cells).to be_a(Hash)
    end
  end

      
end
require 'rspec'
require './lib/ship'
require './lib/cell'

RSpec.describe Ship do
  before(:each) do
      @cell = Cell.new("B4")
      @cruiser = Ship.new("Cruiser", 3)
    end
  end

  describe 'initialize' do
    it "exits with attributes" do
      expect(@cell.coordinate).to be_a(String)
      expect(@cell.coordinate).to eq("B4")
      expect(@cell.ship).to be([])
      expect(@cell.empty?).to be(true)
    end
  end

  describe '#place_ship' do
    it "places ship into the ship array" do
      expect(@cell.ship).to be([])
      expect(@cell.empty?).to be(true)
      @cell.place_ship(@cruiser)
      expect(@cell.ship).to be([@cruiser])
      expect(@cell.empty?).to be(false)
    end
  end
end
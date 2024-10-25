require 'rspec'
require './lib/ship'
require './lib/cell'

RSpec.describe Ship do
  before(:each) do
    @cell_1 = Cell.new("B4")
    @cell_2 = Cell.new("C3")
    @cruiser = Ship.new("Cruiser", 3)
  end

  describe 'initialize' do
    it "exits with attributes" do
      expect(@cell_1.coordinate).to be_a(String)
      expect(@cell_1.coordinate).to eq("B4")
      expect(@cell_1.ship).to be(nil)
      expect(@cell_1.empty?).to be(true)
    end
  end

  describe '#place_ship' do
    it "places ship into the ship array" do
      expect(@cell_1.ship).to be(nil)
      expect(@cell_1.empty?).to be(true)
      @cell_1.place_ship(@cruiser)
      expect(@cell_1.ship).to be(@cruiser)
      expect(@cell_1.empty?).to be(false)
    end
  end

  describe '#fire_upon' do
    it "damages cell_1's ship if it has one" do
        @cell_1.place_ship(@cruiser)
        expect(@cell_1.fired_upon?).to eq(false)
        @cell_1.fire_upon
        expect(@cell_1.ship.health).to eq(2)
        expect(@cell_1.fired_upon?).to eq(true)
    end
  end

  describe 'render' do
    it 'tells result of fire upon based on the cell' do
      expect(@cell_1.render).to be_a(String)
      expect(@cell_1.render).to eq(".")
      #expect(@cell_1.render(true)).to eq(nil)
      @cell_1.fire_upon
      expect(@cell_1.render).to eq("M")
      @cell_2.place_ship(@cruiser)
      expect(@cell_2.render).to eq(".")
      expect(@cell_2.render(true)).to eq("S")
      @cell_2.fire_upon
      expect(@cell_2.render).to eq("H")
      expect(@cruiser.sunk?).to eq(false)
      @cruiser.hit
      @cruiser.hit
      expect(@cruiser.sunk?).to eq(true)
      expect(@cell_2.render).to eq("X")
    end
  end
end
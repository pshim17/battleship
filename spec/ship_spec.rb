require 'spec_helper'

RSpec.describe Ship do
  before(:each) do
    @cruiser = Ship.new("Cruiser", 3)
  end

  describe 'initialize' do
    it "exits with attributes" do
      expect(@cruiser.name).to be_a(String)
      expect(@cruiser.name).to eq("Cruiser")
      expect(@cruiser.name).to be_a(String)
      expect(@cruiser.length).to eq(3)
      expect(@cruiser.length).to be_a(Integer)
      expect(@cruiser.health).to eq(3)
    end
  end

  describe 'hit' do
    it "it subtracts 1 health point from ship" do
      expect(@cruiser.health).to eq(3)
      @cruiser.hit
      expect(@cruiser.health).to eq(2)
      @cruiser.hit
      expect(@cruiser.health).to eq(1)
      @cruiser.hit
      expect(@cruiser.health).to eq(0)
    end
  end
  
  describe 'sunk?' do
    it 'tells if a ship has been sunk (has 0 health)' do
      expect(@cruiser.sunk?).to eq(false)
      @cruiser.hit
      @cruiser.hit
      expect(@cruiser.sunk?).to eq(false)
      @cruiser.hit
      expect(@cruiser.sunk?).to eq(true)
    end
  end
end
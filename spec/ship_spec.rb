require 'rspec'

RSpec.describe Ship do
  before(:each) do
    @cruiser = Ship.new("Cruiser", 3)
  end

  describe 'intialize' do
    it "exits with attributes" do
      expect(@crusier.name).to be_a(String)
      expect(@cruiser.name).to eq("Cruiser")
      expect(@cruiser.length).to eq(3)
      expect(@crusier.length).to be_a(Integer)
      expect(@crusier.health).to eq(3)
    end
  end

  describe 'hit' do
    it "it subtracts 1 health point from ship" do
      expect(@cruiser.health).to eq(3)
      @crusier.hit
      expect(@cruiser.health).to eq(2)
      @crusier.hit
      expect(@cruiser.health).to eq(1)
      @crusier.hit
      expect(@cruiser.health).to eq(0)
    end
  end
  
  describe 'sunk?' do
    it 'tells if a ship has been sunk (has 0 health)' do
      expect(@crusier.ship?).to eq(false)
      @crusier.hit
      @crusier.hit
      expect(@crusier.ship?).to eq(false)
      @crusier.hit
      expect(@crusier.ship?).to eq(true)
    end
  end
end
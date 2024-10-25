require './lib/ship'

class Cell 
  attr_reader :coordinate, :ship

  def initialize(coordinate)
    @coordinate = coordinate
    @ship = nil
    @fire_upon = false
  end

  def place_ship(name)
    @ship = name
  end

  def empty?
    if @ship == nil
      true
    else
      false
    end
  end

 def fire_upon
    @ship.hit
    @fire_upon = true
 end

  def fired_upon?
   @fire_upon
  end
end
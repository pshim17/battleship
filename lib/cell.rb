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
    @fire_upon = true
    @ship.hit if @ship != nil
  end

  def fired_upon?
    @fire_upon
  end 

  def render(show_ship = false)
    if fired_upon? == true && @ship != nil && @ship.health == 0
      return "X"
    elsif fired_upon? == true && empty? == true
      return "M"
    elsif fired_upon? == true && empty? == false 
      return "H"
    elsif show_ship == true && empty? == false 
      return "S"
    elsif show_ship == true && empty? == true
      return nil 
    else
      return "."
    end
  end
end
require './spec/spec_helper'

class Cell 
  attr_reader :coordinate, :ship

  def initialize(coordinate)
    @coordinate = coordinate
    @ship = nil
    @fire_upon = false
  end

  def place_ship(ship)
    @ship = ship
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
    if fired_upon? && @ship && @ship.health == 0
      return "X"
    elsif fired_upon? && empty? == true
      return "M"
    elsif fired_upon? == true && empty? 
      return "H"
    elsif show_ship == true && empty? == false 
      return "S"
    else
      return "."
    end
  end
end
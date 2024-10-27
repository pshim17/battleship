require 'spec_helper'

class Board
  attr_reader :cells

  def initialize
    @cells = {}
    create_cells
  end
  
  def create_cells
    ("A".."D").each do |letter|
      (1..4).each do |number|
        key = "#{letter}#{number}"
        @cells[key] = Cell.new(key)
        @cells.sort
      end
    end
  end

  def valid_coordinate?(coordinate)
    if @cells.keys.include?(coordinate)
      true
    else
      false
    end
  end

  def valid_placement?(ship, coordinates)
    return false unless coordinates.length == ship.length 
    return false unless coordinates.all? { |coordinate| valid_coordinate?(coordinate)}
    consecutive?(coordinates)

  end

  #put helper methods under this line
  def consecutive?(keys)
    num = keys.map(&:to_i)
    (1...num.length).each do |k|
      return false if num[k] != num[k - 1] + 1
    end
    true
  end
end
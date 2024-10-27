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
    numbers = keys.map { |key| key[1].to_i }
    letters = keys.map { |key| key[0] }

    if letters.uniq.length == 1
      (1...numbers.length).each do |k|
        return false if numbers[k] != numbers[k - 1] + 1
      end
      return true
    end

    if numbers.uniq.length == 1
      (1...letters.length).each do |k|
        return false if letters[k] != letters[k - 1].next
      end
      return true
    end
    false
  end
end
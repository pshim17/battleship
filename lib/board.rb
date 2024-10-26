require './lib/cell'

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
end
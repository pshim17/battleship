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
    
    coordinates.each do |coordinate|
      if @cells[coordinate].ship != nil
        return false
      end
    end
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

  def place(ship_name, coordinates)
    coordinates.each do |coordinate|
      cell = @cells[coordinate]
      cell.place_ship(ship_name)
    end
  end

  def render(show_ship = false)
    if show_ship == false 
      board_top_row = "  1 2 3 4 \n"
      board_rows = []

      ("A".."D").each do |letter|
        row_header = "#{letter} "
        row = ""
        (1..4).each do |number|
          row_number = "#{letter}#{number}"
          cell = @cells[row_number]
          row += "#{cell.render(show_ship)} "
        end
        new_row = row_header + row
        board_rows << new_row
      end
      new_board = board_rows.join("\n")
      return board_top_row + new_board + "\n"
    end
  end
end
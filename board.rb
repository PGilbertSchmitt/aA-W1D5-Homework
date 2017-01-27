require_relative "tile.rb"

class Board
  BOARD_SIZE = 9
  attr_reader :bomb_counter

  def self.get_neighbors(pos)
    x, y = pos
    [
      [x + 1, y - 1],
      [x + 1, y    ],
      [x + 1, y + 1],
      [x    , y + 1],
      [x - 1, y + 1],
      [x - 1, y    ],
      [x - 1, y - 1],
      [x    , y - 1]
    ]
  end

  def initialize(bomb_count = 10)
    @grid = Array.new(BOARD_SIZE) { Array.new(BOARD_SIZE) { Tile.new } }
    fill_bombs(bomb_count)
  end

  def fill_bombs(num_of_bombs)
    @bomb_counter = 0
    until @bomb_counter == num_of_bombs
      x, y = rand(0...BOARD_SIZE), rand(0...BOARD_SIZE)
      unless @grid[x][y].bomb?
        @grid[x][y].set_bomb
        @bomb_counter += 1
      end
    end
  end

  def reveal_tile(pos)
    self[pos].reveal
  end

  def display
    puts "    #{(0..8).to_a.join(' ')}"
    puts "  #{"_" * (BOARD_SIZE + 1) * 2}"
    @grid.each_with_index do |row, i|
      puts "#{i} | #{build_row_string(row)}"
    end
  end

  def build_row_string(row)
    row.map { |tile| tile.render }.join(' ')
  end

  def [](pos)
    x, y = pos
    @grid[x][y]
  end

  def []=(pos, val)
    x, y = pos
    @grid[x][y] = val
  end
end

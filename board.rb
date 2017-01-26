require_relative "tile.rb"

class Board
  BOARD_SIZE = 9
  attr_reader :bomb_counter

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

  def [](pos)
    x, y = pos
    @grid[x][y]
  end

  def []=(pos, val)
    x, y = pos
    @grid[x][y] = val
  end
end

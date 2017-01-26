class Tile
  def initialize
    @is_bomb = false
    @is_revealed = false
    @neighbor_count = 0
  end

  def bomb?
    @is_bomb
  end

  def set_bomb
    @is_bomb = true
  end

  def revealed?
    @is_revealed
  end

  def reveal
    @is_revealed = true
  end

  def set_neighbor_count(count)
    @neighbor_count = count
  end

  def render
    show = @is_bomb ? 'B' : @neighbor_count
    @is_revealed ? show : ' '
  end
end

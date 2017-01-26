class Tile
  def initialize
    @is_bomb = false
    @is_revealed = false
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
end

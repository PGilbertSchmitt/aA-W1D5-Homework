class Tile
  def initialize
    @is_bomb = false
    @is_revealed = false
    @is_flagged = false
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

  def flag
    @is_flagged = true
  end

  def unflag
    @is_flagged = false
  end

  def render
    if @is_revealed
      show = @is_bomb ? 'B' : @neighbor_count
      show = '-' if show.zero?
      return show
    else
      @is_flagged ? 'F' : ' '
    end
  end
end

class Tile
  attr_reader :neighbor_bomb_count
  def initialize
    @is_bomb = false
    @is_revealed = false
    @is_flagged = false
    @neighbor_bomb_count = 0
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

  def flagged?
    @is_flagged
  end

  def toggle_flag
    @is_flagged = !@is_flagged
  end

  def inc_bomb_count
    @neighbor_bomb_count += 1
  end

  def render
    if @is_revealed
      show = @is_bomb ? 'B' : @neighbor_bomb_count
      show = '-' if show == 0
      return show
    else
      @is_flagged ? 'F' : ' '
    end
  end
end

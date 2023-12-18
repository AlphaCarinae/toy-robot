class Robot
  attr_reader :direction

  def initialize(direction, board)
    @direction = direction
    @board = board
  end

  def move
    case @direction
    when :north
      @board.y += 1 if (@board.y < Board::MAX_INDEX)
    when :south
      @board.y -= 1 if (@board.y > 0)
    when :east
      @board.x += 1 if (@board.x < Board::MAX_INDEX)
    when :west
      @board.x -= 1 if (@board.x > 0)
    end
  end

  def turn_left
    change_table = {
      north: :west,
      west: :south,
      south: :east,
      east: :north
    }
    @direction = change_table[@direction]
  end

  def turn_right
    change_table = {
      north: :east,
      east: :south,
      south: :west,
      west: :north
    }
    @direction = change_table[@direction]
  end

  def place(x, y, new_direction)
    return if (x < 0 || x > Board::MAX_INDEX || y < 0 || y > Board::MAX_INDEX)

    @board.x = x
    @board.y = y
    @direction = new_direction
  end
end

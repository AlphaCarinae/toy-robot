class Robot
  attr_reader :direction

  def initialize(direction, board)
    @direction = direction
    @board = board
  end

  def move
    case @direction
    when :north
      @board.y += 1 if (y < BOARD::SIZE)
    when :south
      @board.y -= 1 if (y > 0)
    when :east
      @board.x += 1 if (x < BOARD::SIZE)
    when :west
      @board.x -= 1 if (x > 0)
    end
  end

  def place(x, y)
    return if (x < 0 || x > BOARD::SIZE || y < 0 || y > BOARD::SIZE)

    @board.x = x
    @board.y = y
  end
end

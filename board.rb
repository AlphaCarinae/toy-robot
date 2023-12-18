class Board
  MAX_INDEX = 4 # 0..4
  attr_accessor :x, :y

  def initialize
    @x = 0
    @y = 0
  end

  def valid_location?(x_value, y_value)
    return false if x_value < 0 || x_value > MAX_INDEX
    return false if y_value < 0 || y_value > MAX_INDEX

    true
  end
end

require_relative 'board'
require_relative 'robot'

class Executor
  attr_accessor :instruction, :toy_board, :robot

  def initialize
    @instruction = ''
    @toy_board = Board.new
  end

  def execute(new_instruction)
    @instruction = new_instruction
    output = ''

    case @instruction
    when /^PLACE\s(\d),(\d),(NORTH|SOUTH|EAST|WEST)$/
      x = $1.to_i
      y = $2.to_i
      return output if @toy_board.valid_location?(x, y) == false

      direction = $3.downcase.to_sym

      @robot = Robot.new(direction, toy_board)
      @robot.place(x, y, direction)
    when 'LEFT'
      @robot.turn_left if @robot
    when 'RIGHT'
      @robot.turn_right if @robot
    when 'MOVE'
      @robot.move if @robot
    when 'REPORT'
      output = "#{toy_board.x},#{toy_board.y},#{@robot.direction.upcase}" if @robot
    when 'EXIT'
      # do nothing
    else
      output = "Invalid instruction"
    end

    output
  end
end

require_relative 'board'
require_relative 'robot'

print "Welcome to Toy Robot Simulator\n"
print "Valid instructions are listed below\n"
print "PLACE X,Y,F\n"
print "MOVE\n"
print "LEFT\n"
print "RIGHT\n"
print "REPORT\n"
print "EXIT\n\n"

instruction = '' # initialize instruction variable

# initializing the board
toy_board = Board.new

while instruction != 'EXIT'
  # grab the first instruction

  print "Enter instruction: "
  instruction = gets.chomp.upcase

  case instruction
  when /^PLACE\s(\d),(\d),(NORTH|SOUTH|EAST|WEST)$/
    x = $1.to_i
    y = $2.to_i
    direction = $3.downcase.to_sym

    robot = Robot.new(direction, toy_board)
    robot.place(x, y, direction)
  when 'LEFT'
    robot.turn_left if robot
  when 'RIGHT'
    robot.turn_right if robot
  when 'MOVE'
    robot.move if robot
  when 'REPORT'
    print "Output: #{toy_board.x},#{toy_board.y},#{robot.direction.upcase}\n"  if robot
  when 'EXIT'
    # do nothing
  else
    print "Invalid instruction\n"
  end
end

print "Exiting Toy Robot Simulator\n"
exit(0)

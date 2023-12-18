require_relative 'board'
require_relative 'robot'

print "Welcome to Toy Robot Simulator\n"
print "Valid instructions are listed below\n"
print "PLACE X,Y,F\n"
print "MOVE\n"
print "LEFT\n"
print "RIGHT\n"
print "REPORT\n"
print "Enter instruction:"

# initializing the board
toy_board = Board.new

instruction = gets

robot = Robot.new(:north, toy_board)

unless instruction.include?('PLACE')
  print "Please place the robot on the board first\n"
  instruction = gets
end

place_instruction_array = instruction.split(' ')
pp place_instruction_array

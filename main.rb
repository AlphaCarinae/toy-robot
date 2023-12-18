require_relative 'board'
require_relative 'robot'
require_relative 'executor'

print "Welcome to Toy Robot Simulator\n"
print "Valid instructions are listed below\n"
print "PLACE X,Y,F\n"
print "MOVE\n"
print "LEFT\n"
print "RIGHT\n"
print "REPORT\n"
print "EXIT\n\n"

Executor.new.execute

print "Exiting Toy Robot Simulator\n"
exit(0)

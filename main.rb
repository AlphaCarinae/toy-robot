require_relative 'executor'

puts "Welcome to Toy Robot Simulator"
puts "Valid instructions are listed below"
puts "PLACE X,Y,F"
puts "MOVE"
puts "LEFT"
puts "RIGHT"
puts "REPORT"
puts "EXIT\n"

executor = Executor.new

while executor.instruction != 'EXIT'
  print "Enter instruction: "

  instruction = gets.chomp.upcase

  output = executor.execute(instruction)

  puts output unless output.empty?
end

puts "Exiting Toy Robot Simulator"
exit(0)

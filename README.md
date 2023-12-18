# Toy Robot

#### What is this ?

Toy Robot is a ruby coding exercise that we get our potential candidates complete for us to understand their capabilities.

#### What do I need to do ?

## Specification

### Description

- The application is a simulation of a toy robot moving on a square tabletop,
  of dimensions 5 units x 5 units.
- There are no other obstructions on the table surface.
- The robot is free to roam around the surface of the table, but must be
  prevented from falling to destruction. Any movement that would result in the
  robot falling from the table must be prevented, however further valid
  movement commands must still be allowed.
- Create an application that can read in commands of the following form:

```
PLACE X,Y,F
MOVE
LEFT
RIGHT
REPORT
```

- PLACE will put the toy robot on the table in position X,Y and facing NORTH,
  SOUTH, EAST or WEST.
- The origin (0,0) can be considered to be the SOUTH WEST most corner.
- The first valid command to the robot is a PLACE command, after that, any
  sequence of commands may be issued, in any order, including another PLACE
  command. The application should discard all commands in the sequence until a
  valid PLACE command has been executed.
- MOVE will move the toy robot one unit forward in the direction it is currently
  facing.
- LEFT and RIGHT will rotate the robot 90 degrees in the specified direction
  without changing the position of the robot.
- REPORT will announce the X,Y and F of the robot. This can be in any form, but
  standard output is sufficient.
- A robot that is not on the table can choose the ignore the MOVE, LEFT, RIGHT
  and REPORT commands.
- Input can be from a file, or from standard input, as the developer chooses.
- Provide test data to exercise the application.

### Constraints

The toy robot must not fall off the table during movement. This also includes
the initial placement of the toy robot. Any move that would cause the robot
to fall must be ignored.

### Sample output expected as below

a)

```
PLACE 0,0,NORTH
MOVE
REPORT
```

Output: `0,1,NORTH`

- b)

```
PLACE 0,0,NORTH
LEFT
REPORT
```

Output: `0,0,WEST`

c)

```
PLACE 1,2,EAST
MOVE
MOVE
LEFT
MOVE
REPORT
```

Output: `3,3,NORTH`

## Solution

The details of how I have tackled this problem has been detailed here.

### The Premise

- There is a 5 by 5 board, and a robot will receive instructions to be `PLACE`ed using board coordinates (`X,Y`) plus direction (`NORTH`, `SOUTH`, `EAST` or `WEST`) the robot will be facing or a directional `MOVE`. any instruction that can cause it to get out of the 5x5 board should not execute
- The most south western point on the board is considered the origin (0,0)
- `MOVE` will move the robot one square forward (in the current direction)
- `LEFT` will turn the robot's direction 90 degrees counter-clockwise
- `RIGHT` will turn the robot's direction 90 degrees clockwise
- direction change instructions can be given only after a `PLACE` instruction has been given after the application is run (after robot is first placed on the board)
- The application needs to have a user interface, after running the main file as described later the application needs to communicate with the end-user through text interface
- End-user should be informed that the application is running and provide a help at the beginning and on request (optional)
- End-user should receive an error message if the entered instruction can not be comprehended or executed, preferably with instructions on how to fix it (optional)
- after an instruction has been received and run successfully the end-user should be notified of the result by entering `REPORT` command
- an error or the inability to execute an instruction should not stall the program from running
- provided tests should be added as automated tests

### The approach

#### The initial solution

- We put together a `Robot` class, as soon as the `PLACE` direction is given for the first time we initialize an instance of this `ROBOT` class
- We also put together a `Board` class, this will be initialized as soon as the application starts with an *empty* board
- The `Board` instance will hold info about where the robot is at any given point in time, and will respond to `REPORT` command
- The `Robot` instance will hold info on the robot's direction, and will respond to `LEFT`, `RIGHT`, `PLACE` and `MOVE` instructions

#### Steps
- communicate valid instructions
- initialize the board
- skip instructions until a `PLACE` command is enetered
- initialize the robot and apply the new `PLACE` (location)
- iterate through instructions and apply if valid based on constraints
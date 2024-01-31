# Getting started
To get started with the app, first clone the repo and `cd` into the directory:

```
$ git clone https://github.com/hemangini-gohel/chandrayaan_space_craft_simulator.git
$ cd chandrayaan_space_craft_simulator
```

# Prerequisites
* Ruby
* Rspec

# Problem Statement
Chandrayaan 3 Lunar Craft: Galactic Space Craft Control

Run the ruby file by following command:
```
$ ruby spacecraft_simulation.rb
```
Output:
```
Enter values for initial position:
Enter x coordinate
0
Enter y coordinate
0
Enter z coordinate
0
Enter initial direction (n/e/w/s/u/d):
n
Enter instructions (e.g., fblrud without spaces):
frubl
Current Position: X 0, y: 0, z: 0
Current Direction: n
Current Position: X 0, y: 1, z: 0
Current Direction: e
Current Direction: u
Current Position: X 0, y: 1, z: -1
Current Direction: n
Final Position:(0, 1,-1)
Final Direction: N
```

Run the rspec file by following command:
```
$ rpsec
```

# Description
As a scientist at ISRO controlling the latest lunar spacecraft Chandrayaan 3, your task is to develop a program that translates commands sent from Earth into instructions understood by the spacecraft. The spacecraft navigates through the galaxy using galactic coordinates, represented by x, y, z coordinates (x for east or west location, y for north or south location, and z for distance above or below the galactic plane).

# Requirements
You will be given the initial starting point (x, y, z) of the spacecraft and the direction it is facing (N, S, E, W, Up, Down). The spacecraft receives a character array of commands, and you are required to implement the following functionalities:

Move the spacecraft forward/backward (f, b): The spacecraft moves one step forward or backward based on its current direction.
Turn the spacecraft left/right (l, r): The spacecraft rotates 90 degrees to the left or right, changing its facing direction.
Turn the spacecraft up/down (u, d): The spacecraft changes its angle, rotating upwards or downwards.

# Note:
The spacecraft’s initial direction (N, S, E, W, Up, Down) represents the reference frame for movement and rotation.
The spacecraft cannot move or rotate diagonally; it can only move in the direction it is currently facing.
Assume that the spacecraft’s movement and rotations are rigid, and it cannot move beyond the galactic boundaries.
Example
Given the starting point (0, 0, 0) following (x, y, z) and initial direction N, the following commands should result in the indicated final position and direction:

Commands: [“f”, “r”, “u”, “b”, “l”]

Starting Position: (0, 0, 0)

Initial Direction: N

“f” - (0, 1, 0) - N
“r” - (0, 1, 0) - E
“u” - (0, 1, 0) - U
“b” - (0, 1, -1) - U
“l” - (0, 1, -1) - N

Final Position: (0, 1, -1)
Final Direction: N

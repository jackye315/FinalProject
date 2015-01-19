FinalProject
============

Battleship Description

We will be making a Battleship game using processing. We're using a 2D array to setup the board and the coordinates of the ships will be random. The player will play against an AI. First the player will go, then the AI will go similar to the move system in Stuyablo. There will be a method for shooting a specific coordinate on the grid, where the player can choose the coordinates and the AI will shoot at random. The AI will shoot randomly until it hits a ship, in which it will then proceed to hit around the ship until it lands a second hit. Once the second hit is landed, it will follow that sequence. The game will end when either the player's or AI's ships are all destroyed.

Methods:
Shooting method-two parameters, the two coordinates
Setup -sets up grid
AIplay-how the AI will play, using shooting method and random parameters
ShowGrid-shows if shooting hit a ship
PlayGame-Method for playing where one player starts then the other



January 5, 2015
We discussed what we wanted in our game, what methods we needed, how the game will be set up, and how the player will interact with the game.

January 6, 2015
We downloaded Processing and spent the period trying to open/run it.

January 7,2015
We got processing to run and made the initial setup. There are two boards, one shows the player's ships and the other shows the opponents ships. The player should only be able to control its own board in the beginning of the game when the ships are being placed. After that, the player should only be able to interact with the other board to attack. We also discussed more about the game mechanics and started working on the attack method using the mouse. 

January 8, 2015
When the player clicks on the board to attack, that area should change color depending on what's there. 
We got it to change color but it doesn't match up with the coordinates/boxes of the grid.

January 9, 2015
The boxes of the grid now change color and they match up with the coordinates. 
We tried to figure out how they can check the current color of that box to know if there is a ship there.
We also started working on a way to place ships on the board.

January 11, 2015
Created a board class with methods clear() and addShip().
The board is represented by a 2D array and the ships are represented by strings of 'S'.
clear() - clears the board in the beginning of the game
addShip() - adds ship onto the board and returns a boolean if it works
Started working on the methods that will prompt game.
GenerateBoard() - generates player's board
GenerateOpp() - generates the opponent's board
first() - determines who goes first

January 12, 2015
Decided the processing front part was really confusing so we instead worked on the java back end. We continued working on the board and battleship class, and also worked on the attack() method for each turn.

January 13, 2015
Worked on AI stuff like how the AI attacks, know when to attack a certain area, etc. Also discuess more on how we can use processing by adding more variables to the grid. 

January 14, 2015
Worked on the grid. Each cell has a variable called cond which checks if there is a ship or of it's empty. Continued working on the ship moving problem. Currently, only one ship can be dragged.

January 15, 2015
Worked more on dragging each ship. Also looked at how to insert images, found a few ship images.
Each ship can now be moved and rotated. After all the ships are moved into their position, their coordinates will be locked and the battle begins.
Bugs - Some of the ships randomly change position when the mouse is dragging another ship.

January 16, 2015
Worked on text that will be shown depending on if ship is locked or not. Also began inserting methods onto the processing Battleship.
After the ships are locked into their position, the 2D array takes in those coordinates and fills in the appropriate cells with ships.

January 18, 2015
Fixed the addShip() method. Included the opponent addShip() which randomly adds ships onto the opponent's board.

January 19, 2015
Added the attack methods. Player chooses which cell to attack by clicking on the opponent's board. The opponent randomly picks a cell on the player's board and if it hits a ship, it will attack around that area. 
Instructions are added in.
Bugs - Some of the ships randomly change position when the mouse is dragging another ship. 
       The game won't begin if the ships are placed too close to the edge of the board.
       The player's ships can be placed over one another.

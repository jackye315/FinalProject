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

January 12, 2015
Decided the processing front part was really confusing so we instead worked on the java back end. We made a board and a battleship class, and also began working on the "attack" method for each turn.

&import java.util.*;
import java.io.FileNotFoundException;

public class Battleship{
    
    Random rand = new Random();
    
    public static void wait(int n){
	try {
	    Thread.sleep(n);                 
	} catch(InterruptedException ex) {
	    Thread.currentThread().interrupt();
	}
    }

    public static Board GenerateBoard(){
	Board player = new Board();
	//Scan for row and col
	//placeShip(r,c)
    }

    public static Board GenerateOpp(){
	Board opponent = new Board(); //board with opponent's ships
	Board hidden = new Board(); //opponent's hidden board
	//randomly placeShip
    }

    public static void first(Board player, Board opponent){
	boolean turn = rand.nextBoolean();
	int x = rand.nextInt(15);
	int y = rand.nextInt(15);
	if(turn){	   
	    opponent.attack(player, x, y);
	  
	    wait(1500);
	    //print player's board and hidden board
	    
	}
	else{
	    wait(1000);
	    System.out.println("Player goes first.");
	}
	
    }    
   
    public static void combat(Board player, Board other){

    }

    public static void isAlive(Board player){
    }



    

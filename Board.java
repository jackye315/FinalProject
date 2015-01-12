import java.util.*;

public abstract class Board{
    
    char[][] Board;
    char rows, cols;
    String ships = "SS,SSS,SSS,SSS,SSSS,SSSS";
    Random rand = new Random();

    public Board(){
	Board = new char[15][15];
	this.rows = 15;
	this.cols = 15;
	this.clear();
    }

    private void clear(){
	for(int h = 0; h < this.length; h++){
	    for(int w = 0; w < this[h].length; w++){
		this[h][w]='_';
	    }
	}
    }

    public String toString(){
	String result = "";
	for(int h = 0; h < this.length; h++){
	    result += "{";
	    for(int w = 0; w < this[h].length; w++){
		result += this[h][w];
		result += " ";
	    }
	    result += "}";
	    result += "\n";
	}
	return result;
    }

    public boolean addShip(String ship,int row, int col){
	if(row < this.length && col < this[row].length){
	    if(this[row].length-col >= this.length()){
		for(int i = 0; i < ship.length(); i++){
		    if(this[row][col+i]!='_' && this[row][col+i]!=ship.charAt(i)){
			return false;
		    }
		}
		for(int i = 0; i < ship.length(); i++){
		    this[row][col+i]=ship.charAt(i);

		}
		return true;
	    }
	}
	return false;
    }

    public boolean placeShip(int r, int c){
	//places ship based on coordinates entered using addShip()
    }

    public boolean attack(Board other, int r, int c){
	//attacks based on coordinates entered 
	//if char != X && O
	//if char = S --> X
	//if char = _ --> O
    }
    
    public boolean oppAttack(Board other, int r, int c){
	//if hit --> attack around hit area
    }
    

}

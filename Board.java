import java.util.*;

public class Board{
    
    char[][] board;
    char rows, cols;
    String ships = "SS,SSS,SSS,SSS,SSSS,SSSS";
    Random rand = new Random();
    int misscounter;


    public Board(){
	board = new char[15][15];
	this.rows = 15;
	this.cols = 15;
	this.clear();
    }

    private void clear(){
	for(int h = 0; h < board.length; h++){
	    for(int w = 0; w < board[h].length; w++){
		board[h][w]='_';
	    }
	}
    }

    public String toString(){
	String result = "";
	for(int h = 0; h < board.length; h++){
	    result += "{";
	    for(int w = 0; w < board[h].length; w++){
		result += board[h][w];
		result += " ";
	    }
	    result += "}";
	    result += "\n";
	}
	return result;
    }

    public boolean addShip(String ship,int row, int col){
	if(row < board.length && col < board[row].length){
	    if(board[row].length-col >= ship.length()){
		for(int i = 0; i < ship.length(); i++){
		    if(board[row][col+i]!='_' && board[row][col+i]!=ship.charAt(i)){
			return false;
		    }
		}
		for(int i = 0; i < ship.length(); i++){
		    board[row][col+i]=ship.charAt(i);

		}
		return true;
	    }
	}
	return false;
    }

    public boolean placeShip(String ship, int r, int c, int dx, int dy){
	if(dx==dy){
	    dx=1;
	    dy=0;
	}
	if(addShip( ship,  r,  c)){
		int x=r;
		int z=c;
		int y=0;
		while(y<ship.length()){
		    board[x][z]=ship.charAt(y);
		    x=x+dx;
		    z=z+dy;
		    y=y+1;
		}
	    }
	else{
	        return false;
       	    }
	return false;
    
	//places ship based on coordinates entered using addShip()
    }

    public boolean checkShip(int r, int c){
	if(board[r][c]!="_" && board[r][c]!="X" && board[r][c]!="O"){
	    return true;
	}
	else{
	    return false;
	}
    }



    public boolean attack(Board other, int r, int c){
	if (r<15 && c<15 && r>0 && c>0){
	    if(checkShip(r,c)){
		other[r][c]="X";
		}
	    else{
		other[r][c]="O";
		}
	    return true;
	}
	else{
	    return false;
	}
	//attacks based on coordinates entered 
	//if char != X && O
	//if char = S --> X
	//if char = _ --> O
    }
    
    public boolean oppAttack(Board other, int r, int c){
	int dx=0;
	int dy=0;
	if(attack(other,r,c)){
	    if(rand.nextInt(4)==0){
		dx=1;
		dy=0;
	    }
	    if(rand.nextInt(4)==1){
		dx=-1;
		dy=0;
	    }
	    if(rand.nextInt(4)==2){
		dx=0;
		dy=1;
	    }
	    if(rand.nextInt(4)==3){
		dx=0;
		dy=-1;
	    }

	    attack(other,r+dx,c+dy);
	    return true;
	}
	else{
	    return false;
	}
	//if hit --> attack around hit area
    }
    
    public void oppKill(Board other, int r, int c){
	if (other[r][c]=="X" && other[r][c+1]++"X"){
	    attack(other,r,c+1);
	}
	if (other[r][c]=="X" && other[r][c-1]++"X"){
	    attack(other,r,c-1);
	}
	if (other[r][c]=="X" && other[r+1][c]++"X"){
	    attack(other,r+1,c);
	}
	if (other[r][c]=="X" && other[r-1][c+1]++"X"){
	    attack(other,r-1,c);
	}
    }
    public void misscountercount(){
	if(attack){
	    misscounter=misscounter+0;
	}
	else{
	    misscounter=misscounter+1;
	}
    }

    public void superattack(Board other, int r, int c){
	if(misscounter>6){
	    if(r+5<15 && c+5<15){
		int x=0;
		while(x<5){
		    int y=0;
		    while(y<4){
			attack(other, r+y,c+x);
			y=y+1;
		    }
		    x=x+1;
		}
	    }
	}
    }

  public static boolean isAlive(Board player){
	int x=0;
	while(x<player.length){
	    int y=0;
	    while(y<player[x].length){
		if(player[x][y]=="s"){
		    return true;
		}
		y=y+1;
	    }
	    x=x+1;
	}
	return false;
  }


    public String Won{
	if(isAlive){
	}
	else{
	    return "You won, Play again";
	}
    }

}






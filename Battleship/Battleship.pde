class Board{
    
  int[][] board;
  int rows, cols;
  int cond; //-1:empty; 0:ship; 1:hit; 2:miss

  Board(){
    board = new int[15][15];
    this.rows = 15;
    this.cols = 15;
    this.clear();
    }

  void clear(){
    for(int h = 0; h < board.length; h++){
      for(int w = 0; w < board[h].length; w++){
    board[h][w]=-1;
      }
    }
  }

}

Board[][] player;
Board[][] oppponent;

void setup(){
  size(900,600);
  player = new Board[15][15];
  for (int i = 0; i < 15; i++){
      for (int j = 0; j < 15; j++){
          int value;
          if(player[i][j]==-1){
             value = 100;
          }
          else{
              value = 0;
          }
          player[i][j].display(i*30,j*30,30,30,value);
      }
  }
}

void display(int x, int y, int w, int h, int c){
  stroke(225);
  fill(c);
  rect(x,y,w,h);
}
  
          
          
          

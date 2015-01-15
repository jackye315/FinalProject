class Cell{
    
  float x, y;
  float w, h;
  int cond;

  Cell(float tempX, float tempY, float tempW, float tempH, int cond){
    x = tempX;
    y = tempY;
    w = tempW;
    h = tempH;
  }
  
  void display(int x, int y, int c){
    stroke(225);
    fill(c);
    rect(x,y,30,30);
  }
  
}

Cell[][] player;
Cell[][] opponent;
int rows = 13;
int cols = 13;

void setup(){
  size(800,600);
  player = new Cell[rows][cols];
  opponent = new Cell[rows][cols];
  for (int i = 0; i < rows; i++){
      for (int j = 0; j < cols; j++){
          player[i][j] = new Cell(i*30,j*30,30,30,-1);
          opponent[i][j] = new Cell(i*30+400,j*30,30,30,-1);
      }
  }
}

void draw(){
    background(200);
    for (int i = 0; i < rows; i++){
       for (int j = 0; j < cols; j++){
          player[i][j].display(i*30, j*30, 0);
          opponent[i][i].display(i*30+400, j*30, 0);
      }
  }
}


          
          
          

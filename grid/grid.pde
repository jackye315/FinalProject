class Board{
  float x,y,w,h;

  Board(float tempX, float tempY, float tempW, float tempH){
    x = tempX;
    y = tempY;
    w = tempW;
    h = tempH;
  } 

  void display(int c){
    stroke(225);
    fill(c);
    rect(x,y,w,h); 
  }
}


Board[][] grid;
Board[][] grid2;

int cols = 30;
int rows = 20;


void setup(){
  size(900,600);
  grid = new Board[cols][rows];
  for (int i = 0; i < cols/2; i++){
    for (int j = 0; j < rows; j++){
      grid[i][j] = new Board(i*30,j*30,30,30);
      grid[i][j].display(150);
    }
  }
  for (int i = cols/2; i < cols; i++){
    for (int j = 0; j < rows; j++){
      grid[i][j] = new Board(i*30,j*30,30,30);
      grid[i][j].display(100);
    }
  }
}

int value = 0;
int xcor, ycor;

void draw(){
  fill(value);
  if (mousePressed == true){
    xcor = mouseX/30 * 30;
    ycor = mouseY/30 * 30;
    rect(xcor, ycor, 30, 30);
  }
}

void mousePressed(){
  if (value == 0){
    value = 255;
  }
}

  




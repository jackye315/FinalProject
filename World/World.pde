Cell[][] grid;

int cols = 40;
int rows = 40;
boolean overBox = true;
boolean locked = true;
float xOffset = 0.0; 
float yOffset = 0.0; 
float bx;
float by;
int boxSize = 75;
int col=127;

void setup() {
  size(400,400);
  grid = new Cell[cols][rows];
  for (int i = 0; i < cols; i++) {
    for (int j = 0; j < rows; j++) {
      grid[i][j] = new Cell(i*20,j*20,20,20,i+j);
      grid[i][j].display();
    }
  }
}



class Cell {
  float x,y;   
  float w,h;   

  Cell(float tempX, float tempY, float tempW, float tempH, float tempAngle) {
    x = tempX;
    y = tempY;
    w = tempW;
    h = tempH;
  } 
  
 

  void display() {
    stroke(20);
    fill(col,0,0);
    rect(x,y,w,h); 
  }
}

void mousePressed(){
col+=50;
col%=255;
println(col);
} 





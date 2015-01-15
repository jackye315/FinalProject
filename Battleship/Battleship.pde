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
  
  void display(int x, int y, int r, int g, int b){
    stroke(225);
    fill(r,g,b);
    rect(x,y,30,30);
  }
  
}

Cell[][] player;
Cell[][] opponent;
int rows = 13;
int cols = 13;
float x1, x2, x3, x4, x5;
float y1, y2, y3, y4, y5;
int shipW = 90;
int shipH = 30;
boolean overShip = false;
boolean clicked = false;
float xOffset = 0.0;
float yOffset = 0.0;

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
  x1 = 30;
  y1 = 400;
  x2 = 150;
  y2 = 400;
  x3 = 270; 
  y3 = 400;
  x4 = 390;
  y4 = 400;
  x5 = 510;
  y5 = 400;
}

void draw(){
    background(200);
    for (int i = 0; i < rows; i++){
       for (int j = 0; j < cols; j++){
          player[i][j].display(i*30, j*30, 100, 100, 100);
          opponent[i][i].display(i*30+400, j*30, 100, 100, 100);
      }
  }
  createShip();
  if (mouseX > x1-shipW && mouseX < x1+shipW && 
      mouseY > y1-shipH && mouseY < y1+shipH) {
    overShip = true;  
    if(!clicked) { 
      stroke(255); 
      fill(100);
    } 
  } else {
    stroke(153);
    fill(100);
    overShip = false;
  }
}

void createShip(){
   fill(0);
   rect(x1, y1, 90, 30, 100);
   rect(x2, y2, 90, 30, 100);
   rect(x3, y3, 90, 30, 100);
   rect(x4, y4, 90, 30, 100);
   rect(x5, y5, 90, 30, 100);
  
}

void mousePressed() {
  if(overShip) { 
    clicked = true; 
    fill(255, 255, 255);
  } else {
    clicked = false;
  }
  xOffset = mouseX-x1; 
  yOffset = mouseY-y1; 

}

void mouseDragged() {
  if(clicked) {
    x1 = mouseX-xOffset; 
    y1 = mouseY-yOffset; 
  }
}

void mouseReleased() {
  clicked = false;
}
          
          
          

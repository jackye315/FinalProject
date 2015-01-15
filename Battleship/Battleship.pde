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
int shipClicked;
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
  x2 = 120;
  y2 = 400;
  x3 = 240; 
  y3 = 400;
  x4 = 360;
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
  if (checkShip(x1, y1, 60, 30) || checkShip(x2, y2, 90, 30) ||
      checkShip(x3, y3, 90, 30) || checkShip(x4, y4, 120, 30) ||
      checkShip(x5, y5, 120, 30)) {     
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


boolean checkShip(float x, float y, int w, int h){
  whichShip(x);
  if(mouseX > x-w && mouseX < x+w && 
     mouseY > y-h && mouseY < y+h){
       return true;
     } else{
       return false;
     }
}
  
void whichShip(float x){
  if(x == x1){
    shipClicked = 1;
  }
  if(x == x2){
    shipClicked = 2;
  }
  if(x == x3){
    shipClicked = 3;
  }
  if(x == x4){
    shipClicked = 4;
  }
  if(x == x5){
    shipClicked = 5;
  }
}
  

void createShip(){
   fill(0);
   rect(x1, y1, 60, 30, 100);
   rect(x2, y2, 90, 30, 100);
   rect(x3, y3, 90, 30, 100);
   rect(x4, y4, 120, 30, 100);
   rect(x5, y5, 120, 30, 100);
  
}

void mousePressed() {
  if(overShip) { 
    clicked = true; 
    fill(255, 255, 255);
  } else {
    clicked = false;
  }
  if(shipClicked == 1){
    xOffset = mouseX-x1; 
    yOffset = mouseY-y1;
  }
  if(shipClicked == 2){
    xOffset = mouseX-x2; 
    yOffset = mouseY-y2;
  }
  if(shipClicked == 3){
    xOffset = mouseX-x3; 
    yOffset = mouseY-y3;
  }
  if(shipClicked == 4){
    xOffset = mouseX-x4; 
    yOffset = mouseY-y4;
  }
  if(shipClicked == 5){
    xOffset = mouseX-x5; 
    yOffset = mouseY-y5;
  }

}

void mouseDragged() {
  if(clicked) {
    if(shipClicked == 1){
      x1 = mouseX-xOffset; 
      y1 = mouseY-yOffset; 
    }
    if(shipClicked == 2){
      x2 = mouseX-xOffset; 
      y2 = mouseY-yOffset; 
    }
    if(shipClicked == 3){
      x3 = mouseX-xOffset; 
      y3 = mouseY-yOffset; 
    }
    if(shipClicked == 4){
      x4 = mouseX-xOffset; 
      y4 = mouseY-yOffset; 
    }
    if(shipClicked == 5){
      x5 = mouseX-xOffset; 
      y5 = mouseY-yOffset; 
    }
  }
}

void mouseReleased() {
  clicked = false;
}
          
          
          

class Cell{
    
  float x, y;
  float w, h;
  int cond;


  Cell(float tempX, float tempY, float tempW, float tempH, int c){
    x = tempX;
    y = tempY;
    w = tempW;
    h = tempH;
    cond = c;
  }
  
  void display(int x, int y){
    fill(100, 100, 100);
    if(this.cond == 2){
      fill(102, 0, 0);
    }
    if(this.cond == 3){
      fill(0, 102, 153);
    }
    stroke(225);
    rect(x,y,30,30);
  }
  
  
  void setCond(int c){
    cond = c;
  }
  
  int getCond(){
    return cond;
  }
  
}

Cell[][] player;
Cell[][] opponent;
int rows = 13;
int cols = 13;
float x1, x2, x3, x4, x5;
float y1, y2, y3, y4, y5;
int w1, w2, w3, w4, w5;
int h1, h2, h3, h4, h5;
int shipClicked;
boolean overShip = false;
boolean clicked = false;
boolean rotate = false;
boolean locked = false;
boolean start = false;
boolean end = false;
boolean turn = true;
boolean lose = false;
float xOffset = 0.0;
float yOffset = 0.0;
//PImage img=loadImage("Ship4.jpg", "jpg");

void setup(){

  size(830,650);
  player = new Cell[rows][cols];
  opponent = new Cell[rows][cols];
  for (int i = 0; i < rows; i++){
      for (int j = 0; j < cols; j++){
          player[i][j] = new Cell(i*30,j*30,30,30,0);
          opponent[i][j] = new Cell(i*30+400,j*30,30,30,0);
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
  w1 = 60;
  w2 = 90;
  w3 = 91;
  w4 = 120;
  w5 = 121;
  h1 = 30;
  h2 = 31;
  h3 = 32;
  h4 = 33;
  h5 = 34;
  
}

void draw(){
  background(200);
  for (int i = 0; i < rows; i++){
    for (int j = 0; j < cols; j++){
       player[i][j].display(j*30, i*30);
       opponent[i][j].display(j*30+400, i*30);
     }
   }
  instructions();  
  createShip();
  if (checkShip(x1, y1, w1, h1) || checkShip(x2, y2, w2, h2) ||
      checkShip(x3, y3, w3, h3) || checkShip(x4, y4, w4, h4) ||
      checkShip(x5, y5, w5, h5)) {     
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
  if(start){
    if(isDead(player) || isDead(opponent)){
      if(isDead(player)){
        lose = true;
      }
      start = false;
      end = true;
    }
  }
  //image(img,0,0);
  //reveal();
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

void rotateShip(int w, int h){
  if(overShip && mouseButton == RIGHT){
    if(!rotate){
       rotate = true;
    }
    if(rotate){
      rotate = false;
    }
         if(w == w1){
           w1 = h;
           h1 = w;
         }
         if(w == w2){
           w2 = h;
           h2 = w;
         }
         if(w == w3){
           w3 = h;
           h3 = w;
         }
         if(w == w4){
           w4 = h;
           h4 = w;
         }
         if(w == w5){
           w5 = h;
           h5 = w;
         }
  }         
 
}
  
void createShip(){
   fill(0, 0, 0, 100);
   rect(x1, y1, w1, h1, 100);
   rect(x2, y2, w2, h2, 100);
   rect(x3, y3, w3, h3, 100);
   rect(x4, y4, w4, h4, 100);
   rect(x5, y5, w5, h5, 100);
}

void lockShip(){
  if(!locked){
    if(x1 < 360 && x2 < 360 && x3 < 360 && x4 < 360 && x5 < 360 &&
       y1 < 360 && y2 < 360 && y3 < 360 && y4 < 360 && y5 < 360 &&
       x1 > 0 && x2 > 0 && x3 > 0 && x4 > 0 && x5 > 0 &&
       y1 > 0 && y2 > 0 && y3 > 0 && y4 > 0 && y5 > 0){
         locked = true;
         x1 = int(x1) / 30 * 30;
         x2 = int(x2) / 30 * 30;
         x3 = int(x3) / 30 * 30;
         x4 = int(x4) / 30 * 30;
         x5 = int(x5) / 30 * 30;
         y1 = int(y1) / 30 * 30;
         y2 = int(y2) / 30 * 30;
         y3 = int(y3) / 30 * 30;
         y4 = int(y4) / 30 * 30;
         y5 = int(y5) / 30 * 30;
         addShip((int)x1/30, (int)y1/30, (int)w1/30, (int)h1/30);
         addShip((int)x2/30, (int)y2/30, (int)w2/30, (int)h2/30);
         addShip((int)x3/30, (int)y3/30, (int)w3/30, (int)h3/30);
         addShip((int)x4/30, (int)y4/30, (int)w4/30, (int)h4/30);
         addShip((int)x5/30, (int)y5/30, (int)w5/30, (int)h5/30);
         for(int tries = 0; tries < 100; tries++){
           boolean added = false;
           added = opponentShip((int)random(cols), (int)random(rows), (int)w1/30, (int)h1/30);
           if(added){
             break;
           }
         }
            for(int tries = 0; tries < 100; tries++){
           boolean added = false;
           added = opponentShip((int)random(cols), (int)random(rows), (int)w2/30, (int)h2/30);
           if(added){
             break;
           }
         }
            for(int tries = 0; tries < 100; tries++){
           boolean added = false;
           added = opponentShip((int)random(cols), (int)random(rows), (int)w3/30, (int)h3/30);
           if(added){
             break;
           }
         }
            for(int tries = 0; tries < 100; tries++){
           boolean added = false;
           added = opponentShip((int)random(cols), (int)random(rows), (int)w4/30, (int)h4/30);
           if(added){
             break;
           }
         }
            for(int tries = 0; tries < 100; tries++){
           boolean added = false;
           added = opponentShip((int)random(cols), (int)random(rows), (int)w5/30, (int)h5/30);
           if(added){
             break;
           }
         }
        start = true;
       }
       
    }
}

void addShip(int x, int y, int w, int h){
  if(locked){
    for(int i = 0; i < h; i++){
      for(int j = 0; j < w; j++){
        player[y+i][x+j].setCond(1);
      }
    }
  }
}

boolean opponentShip(int x, int y, int w, int h){
   if(locked){
     if(checkShip2(x, y, w, h)){
       for(int i = 0; i < h; i++){
         for(int j = 0; j < w; j++){
           opponent[y+i][x+j].setCond(1);
         }
       }
       return true;
     }
   }
  return false;
}

boolean checkShip2(int x, int y, int w, int h){
  if(x+w >= cols || y+h >= rows){
    return false;
  }
  for(int i = 0; i < h; i++){
    for(int j = 0; j < w; j++){
      if(opponent[y+i][x+j].getCond()!=0){
        return false;
      }
    }
  }
  return true;
}


void playerAttack(){
  if(start){
    if(mouseX > 390 && mouseX < 790 && mouseY < 400){
      if(opponent[mouseY/30][(mouseX-400)/30].getCond()==1){
        opponent[mouseY/30][(mouseX-400)/30].setCond(2);
        oppAttack();
      }
      if(opponent[mouseY/30][(mouseX-400)/30].getCond()==0){
        opponent[mouseY/30][(mouseX-400)/30].setCond(3);
        oppAttack();
      }
    }
  }
}
  
int tempxcor, tempycor;
boolean target = false;
    
void oppAttack(){    
    int xcor = 0;
    int ycor = 0;
    for(int tries = 0; tries < 100; tries++){
      if(target){
        if(tempxcor!=0){
          xcor = tempxcor - 1;
          ycor = tempycor;
          if(player[ycor][xcor].getCond()==0 || player[ycor][xcor].getCond()==1){
            break;
          }
        }
        if(tempycor!=0){
          xcor = tempxcor;
          ycor = tempycor - 1;
          if(player[ycor][xcor].getCond()==0 || player[ycor][xcor].getCond()==1){
            break;
          }
        }
        if(tempxcor!=12){
          xcor = tempxcor + 1;
          ycor = tempycor;
          if(player[ycor][xcor].getCond()==0 || player[ycor][xcor].getCond()==1){
            break;
          }
        }
        if(tempycor!=12){
          xcor = tempxcor;
          ycor = tempycor + 1;
          target = false;
          if(player[ycor][xcor].getCond()==0 || player[ycor][xcor].getCond()==1){
            break;
          }
        }
      }
      xcor = (int)random(cols);
      ycor = (int)random(rows);
      if(player[ycor][xcor].getCond()==0 || player[ycor][xcor].getCond()==1){
        break;
      }
    }
    if(player[ycor][xcor].getCond()==1){
       player[ycor][xcor].setCond(2);
       target = true;
       tempxcor = xcor; 
       tempycor = ycor;
       }
       if(player[ycor][xcor].getCond()==0){
          player[ycor][xcor].setCond(3);
       }
}
      

boolean isDead(Cell[][]a){
    boolean dead = true;
    for(int i = 0; i < rows; i++){
      for(int j = 0; j < cols; j++){
        if(a[i][j].getCond()==1){
          dead = false;
        }
      }
    }
    return dead;
}
  

void instructions(){
 textSize(25);
 fill(0, 0, 0, 200);
 text("Player", 160, 460);
 text("Opponent", 540, 460);
 if(!locked){
   text("To set up the game, drag the ships to the board.", 30, 520); 
   text("Right click the ship to rotate.", 30, 550);
   text("Click enter when done.", 30, 580);
 } 
 if(start){
   fill(102, 0, 0);
   text("Red = Hit", 30, 520);
   fill(0, 102, 153);
   text("Blue = Miss", 30, 550); 
 }
 if(!start && end){
   if(!lose){
     text("You win!", 360, 520);
   }
   else{
     text("You lose!", 360, 520);
   }
 }
}


void reveal(){
  if(start){
  textSize(10);
  text(toString(player), 30, 430); 
  fill(0, 102, 153, 51);
  text(toString(opponent), 430, 430);
  fill(0, 102, 153, 51);
  }
}

void mousePressed() {
  if(overShip && mouseButton == LEFT) { 
    clicked = true; 
    fill(255, 255, 255);
  } else {
    clicked = false;
  }
  if(shipClicked == 1){
    rotateShip(w1, h1);
    xOffset = mouseX-x1; 
    yOffset = mouseY-y1;
  }
  if(shipClicked == 2){
    rotateShip(w2, h2);
    xOffset = mouseX-x2; 
    yOffset = mouseY-y2;
  }
  if(shipClicked == 3){
    rotateShip(w3, h3);
    xOffset = mouseX-x3; 
    yOffset = mouseY-y3;
  }
  if(shipClicked == 4){
    rotateShip(w4, h4);
    xOffset = mouseX-x4; 
    yOffset = mouseY-y4;
  }
  if(shipClicked == 5){
    rotateShip(w5, h5);
    xOffset = mouseX-x5; 
    yOffset = mouseY-y5;
  }
}

void mouseClicked(){
    playerAttack();
}

void mouseDragged() {
  if(!locked && clicked) {
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

void keyPressed() {
  if(key == ENTER){
      lockShip();
    }
}

String toString(Cell[][]a){
  String result = "";
  for(int h = 0; h < rows; h++){
      result += "{";
      for(int w = 0; w < cols; w++){
        result += a[h][w].getCond();
        result += " ";
        }
      result += "}";
      result += "\n";
    }
  return result;        
}  
          
          

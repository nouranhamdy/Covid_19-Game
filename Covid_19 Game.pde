
PImage background;
PImage finish;
PImage end;
boolean isStartPage = false;
Ball[] balls = new Ball[50];
ArrayList<Line> lines   = new ArrayList(); 
int healthy=0;
int deadballs=0;
float coX[], coY[];
int fallingspeedY=7;

void setup(){
  size(1000,1000);
  textSize(20);
  surface.setTitle("Coronavirus Game");
  finish= loadImage("surgical-mask.png");
  end=loadImage("sterilization4.jpg");
  background = loadImage("coronavirus.png");
  for(int i=0; i< balls.length;i++){
    balls[i] = new Ball(random(width),random(height));
  }
  
  // array of x- & y-coordinates of the 80 masks
  coX=new float[80];
  coY=new float[80];
  for (int i=0; i<80; i++) {
    coX[i]=30*i;
    coY[i]=random(0, 1000);
  }

}

void draw()
{
  if(isStartPage == false)
    start_Page();
  else if(isStartPage == true)
  {
    //game started
    background(255);
   for (int i=0; i< lines.size();i++){
       lines.get(i).move();
  if(dist(mouseX,mouseY,lines.get(i).x,lines.get(i).y)<70&&keyPressed &&key == ' '){lines.remove(i);i--;}
}


for (int i=0; i< balls.length;i++){
        balls[i].move();
        
      for (int j=0; j<balls.length;j++){
        
         float d=dist(balls[i].x,balls[i].y,balls[j].x,balls[j].y);
         
         if(d<20 && i!= j){if(balls[i].inf&&!balls[j].inf&&round(random(50))==1){balls[j].inf=true;}}
         
         if(d<20 &&i!= j){if(balls[j].inf&&!balls[i].inf&&round(random(50))==1){balls[i].inf=true;}}
  
      }
}
  
  push();
  strokeWeight(30);
if(mousePressed){lines.add(new Line(mouseX,mouseY,pmouseX,pmouseY));}
  pop();
  
  // returns the varaibles to zero to avoid accumulative sum, due to draw infinite loop.
    healthy=0;
    cured=0;
    deadballs=0;
    for (int i=0; i< balls.length; i++) {
      //for each draw iteration check #healthyballs and #deadballs 
      if (balls[i].healthy) {
        healthy++;
      }
      if (balls[i].dead) {
        deadballs++;
      }
      // end the game whenever all non-dead balls are healthy.
      if (healthy+deadballs==balls.length) {
        background(255);
        displayEnd();
      }
    }
  
  }

}

/////////////////////////////////////////////////////
void start_Page()
{
    image(background, 0, 0, width, height);
    push();
    fill(255);
    //fill(0);
    text("Healthy \nInfected \nRecovered \nDead", width-170, 55);
    noStroke();
    fill(0,255,0);
    ellipse(width-200,50,20,20);
    fill(255,0,0);
    ellipse(width-200,80,20,20); //height+30 of the above ball
    fill(255,255,0);
    ellipse(width-200,110,20,20);
    fill(0);
    ellipse(width-200,140,20,20);
    pop();
    fill(255);
    text(" Rules: \n Draw lines to isolate the infected. \n Spacebar to erase lines.", 50, 50);
    push();
    fill(255);
    noStroke();
    rect(80,150,200,200);
    fill(0,255,0);
    ellipse(120,250,20,20);
    fill(255,0,0);
    ellipse(240,250,20,20);
    pop();
    fill(0);
    strokeWeight(8);
    line(180,150,180,frameCount%(200)+150);
    push();
    noStroke();
    fill(0);
    ellipse(width/2,height-200,150,100);
    fill(255);
    textSize(40);
    text("Start",width/2 -30,height-190);
    pop();
    if(mouseX > (width/2)-75 && mouseX < (width/2)+75 && mouseY > height-250 && mouseY < height-150 && mousePressed)
      isStartPage = true;    
}



/////////////////////////////////////////////////////

void displayEnd() {
  background(255);
  image(end, 100, 100, width-200, height-100);
  fill(0, 0, 0);
  textSize(70);
  text("DONE!!  ALL IS CLEAN", 120, height-900);
  for (int i=0; i<80; i++) {
    image(finish, coX[i], coY[i], 70, 70);
    if (coY[i]>height) {
      coY[i]=0;
    }
  }
  //change the y-coordinate of each mask to fall down.
  for (int i=0; i<80; i++) {
    coY[i]+=fallingspeedY;
  }
}


/////////////////////////////////////////////////////


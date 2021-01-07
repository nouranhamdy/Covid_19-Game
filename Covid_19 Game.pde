
PImage background;
boolean isStartPage = false;
Ball[] balls = new Ball[50];
ArrayList<Line> lines   = new ArrayList(); 
void setup(){
  size(1000,1000);
  textSize(20);
  surface.setTitle("Coronavirus Game");
  background = loadImage("coronavirus.png");
  for(int i=0; i< balls.length;i++){
    balls[i] = new Ball(random(width),random(height));
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

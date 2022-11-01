
Sprite s;
Sprite s2; 
int x;
int y;
final int FRAME_RATE = 60;
PImage img; 

void setup(){
  initializeGame();
  frameRate(FRAME_RATE);
  size(640, 360);
  background(255);
  // s = new Sprite("SumoWalkForwardSpritesheet.png",6,2,3,100,100,6); for Old Code
  img = loadImage("SumoWalkForwardSpritesheet.png");
  s = new Sprite(img,6,2,3,100,100,6);
  s2 = new Sprite(img,6,2,3,100,100,1);
  x = 0;
  y = 0;
}


void draw(){
  background(255);
  
  s.render(x,y);
  s2.render(x + 100, y + 10);
  
}

void initializeGame(){
  
}

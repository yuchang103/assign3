final int GAME_START=1,GAME_LOSE=2,GAME_RUN=3;
int gameState=GAME_START;
int x1,y1;//fighter
int x2,y2;//treasure
int x3,y3;//enemy
int xb1,xb2;//background
int hp;//hp
int i;
PImage aImg;
PImage bImg;
PImage cImg;
PImage d1Img;
PImage d2Img;
PImage hpImg;
PImage start1Img;
PImage start2Img;
PImage end1Img;
PImage end2Img;
float V = 5;

boolean upPressed = false;
boolean downPressed = false;
boolean leftPressed = false;
boolean rightPressed = false;

void setup(){
  size(640,480);
  xb1=640;
  xb2=0;
  x1=530;
  y1=200;
  x3=-300;
  y3=floor(random(20,400));
  x2=floor(random(3,300));
  y2=floor(random(3,277));
  hp=40;
  aImg=loadImage("img/fighter.png");
  bImg=loadImage("img/treasure.png");
  cImg=loadImage("img/enemy.png");
  d1Img=loadImage("img/bg1.png");
  d2Img=loadImage("img/bg2.png");
  hpImg=loadImage("img/hp.png");
  start1Img=loadImage("img/start1.png");
  start2Img=loadImage("img/start2.png");
  end1Img=loadImage("img/end1.png");
  end2Img=loadImage("img/end2.png");
}

void draw(){
  switch(gameState){
    case GAME_START:
    image(start2Img,0,0);
    if(mouseX>200&&mouseX<460&&mouseY>375&&mouseY<415){
      image(start1Img,0,0);
    }
    if(mousePressed){
     gameState=GAME_RUN; 
    }
    break;
    case GAME_RUN:
  if (upPressed) {
    y1 -= V;
    if(y1<0){
     y1=0; 
    }
  }
  if (downPressed) {
    y1 += V;
    if(y1>430){
     y1=430; 
    }
  }
  if (leftPressed) {
    x1 -= V;
    if(x1<0){
     x1=0; 
    }
  }
  if (rightPressed) {
    x1 += V;
    if(x1>590){
     x1=590;
    }
  }
  if(((x1>=x2 && x1<=x2+40) && (y1+25>=y2 && y1+25<=y2+40))||((x1+25>=x2 && x1+25<=x2+40) && (y1>=y2 && y1<=y2+40))||((x1+25>=x2 && x1+25<=x2+40) && (y1+50>=y2 && y1+50<=y2+40))||((x1+50>=x2 && x1+50<=x2+40) && (y1>=y2 && y1<=y2+40))||((x1+50>=x2 && x1+50<=x2+40) && (y1+50>=y2 && y1+50<=y2+40))||((x1+50>=x2 && x1+25<=x2+40) && (y1+50>=y2 && y1+25<=y2+40))){
    x2=floor(random(3,300));
    y2=floor(random(3,277));
    hp+=20;
    if(hp>200){
     hp=200; 
    }
  }
  image(d1Img,xb1-640,0);
  xb1=xb1+1;
  xb1%=1280;
  image(d2Img,xb2-640,0);
  xb2=xb2+1;
  xb2%=1280;
  
  image(bImg,x2,y2);
  image(cImg,x3,y3);
  image(cImg,x3+60,y3);
  image(cImg,x3+120,y3);
  image(cImg,x3+180,y3);
  image(cImg,x3+240,y3);
  image(cImg,x3-940,y3);
  image(cImg,x3-890,y3-50);
  image(cImg,x3-840,y3-100);
  image(cImg,x3-790,y3-150);
  image(cImg,x3-740,y3-200);
  image(cImg,x3-1830,y3);
  image(cImg,x3-1780,y3-50);
  image(cImg,x3-1780,y3+50);
  image(cImg,x3-1730,y3+100);
  image(cImg,x3-1730,y3-100);
  image(cImg,x3-1680,y3-50);
  image(cImg,x3-1680,y3+50);
  image(cImg,x3-1630,y3);
  x3=x3+3;
  if(x3>=2470){
      x3=-300;
    y3=floor(random(3,420));
  }
  if(x3>=639&&x3<=641){
    y3=floor(random(253,300));
  }
  if(x3>=1576&&x3<=1570){
    y3=floor(random(103,260));
  }
  image(aImg,x1,y1);
  colorMode(RGB);
  
  fill(255,0,0);
  stroke(255,0,0);
  rect(11,16,hp,13);
  
  image(hpImg,10,10);
  break;
    case GAME_LOSE:
    image(end2Img,0,0);
    if(mouseX>210&&mouseX<440&&mouseY>305&&mouseY<350){
      image(end1Img,0,0);
    }
    if(mousePressed){
     gameState=GAME_RUN; 
     xb1=640;
     xb2=0;
     x1=530;
     y1=200;
     y3=floor(random(20,400));
     x2=floor(random(3,300));
     y2=floor(random(3,277));
     hp=40;
    }
    break;
}}

void keyPressed() {
  if (key == CODED) { // detect special keys 
    switch (keyCode) {
      case UP:
        upPressed = true;
        break;
      case DOWN:
        downPressed = true;
        break;
      case LEFT:
        leftPressed = true;
        break;
      case RIGHT:
        rightPressed = true;
        break;
    }
  }
}

void keyReleased() {
  if (key == CODED) {
    switch (keyCode) {
      case UP:
        upPressed = false;
        break;
      case DOWN:
        downPressed = false;
        break;
      case LEFT:
        leftPressed = false;
        break;
      case RIGHT:
        rightPressed = false;
        break;
    }
  }
}

import fisica.*;

// Timer
color invisDD = 255;
color invisSD = 0;

color invisDD2 = 255;
color invisSD2 = 0;

color timerColor;

// Colors
color black = #000000;
color white = #FFFFFF;
color green = color(144, 238, 144);
color yellow = color(255, 255, 0);
color red = color(255, 0, 0);
color blue = color(0, 0, 255);

// MODE FUNCTIONS
int mode;
final int PLR1GAME = 1;
final int LOBBY = 2;
final int PLR2GAME = 3;

// Key Press
boolean rkey;

// Scoring
int p1Score, p2Score, timer1, timer2;

// Image
PImage basketBall;

// Player 1 Ball Hit Handler
boolean hitCollisionDetector1(FCircle basketball1) {
  ArrayList<FContact> contactList = basketball1.getContacts();
  int i = 0;
  while(i < contactList.size()) {
    FContact myContact = contactList.get(i);
    if (myContact.contains(collisionDetector1))
      return true;
    i++;
  }
  return false;
}


// Player 2 Ball Hit Handler
boolean hitCollisionDetector2(FCircle basketball2) {
  ArrayList<FContact> contactList = basketball2.getContacts();
  int i = 0;
  while(i < contactList.size()) {
    FContact myContact = contactList.get(i);
    if (myContact.contains(collisionDetector2))
      return true;
    i++;
  }
  return false;
}

// Assets Storage
FCircle basketball1;
FCircle basketball2;
FPoly ground;
FPoly hoop;
FPoly barrier;
FPoly leftBarrier;
FPoly rightBarrier;
FPoly collisionDetector1;
FPoly collisionDetector2;

void setup() {
  size(2000, 1300);
  mode = PLR1GAME;
  
  timerColor = green;
  timer1 = 1100;
  timer2 = 1100;

  // Load Assets
  basketBall = loadImage("basketball.png");

  makeWorld();
  
  // Player 1
  makeGround1();
  makeBasketball1();
  makeHoop1();
  makeBarrier1();
  makeLeftBarrier1();
  makeRightBarrier1();
  makeCollisionDetector1();
  
  // Player 2
  makeGround2();
  makeBasketball2();
  makeHoop2();
  makeBarrier2();
  makeLeftBarrier2();
  makeRightBarrier2();
  makeCollisionDetector2();  
}

void draw() {
  if (mode == PLR1GAME) {
    plr1game();
  }  else if (mode == PLR2GAME) {
    plr2game();
  } else if (mode == LOBBY) {
    lobby();
  } else {
    println("Mode Error: "+mode);
  }
  
  if (hitCollisionDetector1(basketball1)) {
    p1Score++;
    
    basketball1.setPosition(100, height/2);
    basketball1.setVelocity(0,0);    
  }
  
  if (hitCollisionDetector2(basketball2)) {
    p2Score++;
    
    basketball2.setPosition(100, height/2);
    basketball2.setVelocity(0,0);    
  }  
}

//WORLD/FISICA INITIALIZER ===========================================================================================
FWorld world;

// Initialize World
void makeWorld() {
  Fisica.init(this);
  world = new FWorld();
  world.setGravity(0, 900);
}

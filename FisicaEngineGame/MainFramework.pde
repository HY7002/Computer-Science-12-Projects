import fisica.*;

// MODE FUNCTIONS
int mode;
final int GAME = 1;

// Scoring
int score, timer;

// Image
PImage basketBall;

// BBal Contact Handler
boolean hitHoop(FCircle hoop) {
  ArrayList<FContact> contactList = basketball.getContacts();
  int i = 0;
  while(i < contactList.size()) {
    FContact myContact = contactList.get(i);
    if (myContact.contains(hoop))
      return true;
    i++;
  }
  return false;
}

// Assets Storage
FCircle basketball;
FPoly ground;
FPoly hoop;
FPoly barrier;
FPoly leftBarrier;
FPoly rightBarrier;

void setup() {
  size(2000, 1300);
  mode = GAME;

  timer = 1100;

  // Load Assets
  basketBall = loadImage("basketball.png");

  makeWorld();
  makeGround();
  makeBasketball();
  makeHoop();
  makeBarrier();
  makeLeftBarrier();
  makeRightBarrier();
}

void draw() {
  if (mode == GAME) {
    game();
  } else {
    println("Mode Error: "+mode);
  }
  
  if (hitHoop(basketball)) {
    score++;
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

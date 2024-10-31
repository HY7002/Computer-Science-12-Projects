import fisica.*;

//MODE FUNCTIONS
int mode;
final int GAME = 1;

//Scoring
int score, timer;

// Image
PImage basketBall;

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
}

//WORLD/FISICA INITIALIZER ===========================================================================================
FWorld world;

// Initialize World
void makeWorld() {
  Fisica.init(this);
  world = new FWorld();
  world.setGravity(0, 900);
}

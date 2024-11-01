// MODE FUNCTIONS
int mode;
final int INTRO = 1;
final int GAME = 2;
final int PAUSE = 3;
final int GAMEOVER = 4;

// Keyboard Variables
boolean wkey, skey, akey, dkey, upkey, downkey, leftkey, rightkey;


//Player Variables
float leftx, lefty, leftd, rightx, righty, rightd;

// Ball Variables
float vx, vy;
float ballx, bally, balld;
color contactColor;

//Scoring
int leftscore, rightscore, timer;

void setup() {
  size(1500, 1000);
  mode = GAMEOVER;
  
  // Left Player Initialization
  leftx = 100;
  lefty = height/2;
  leftd = 100;
  
  // Right Player Initialization
  rightx = 1400;
  righty = height/2;
  rightd = 100;
  
  // Ball Initialization
  ballx = width/2;
  bally = height/2;
  balld = 70;
  contactColor = 0;
  
  vx = 0;
  vy = 0;
  
  // Keyboard Initialization
  wkey = skey = akey = dkey = upkey = downkey = leftkey = rightkey = false;
  
  timer = 50;
}

void draw() {
  if (mode == INTRO) {
    intro();
  } else if (mode == GAME) {
    game();
  } else if (mode == PAUSE ) {
    pause();
  } else if (mode == GAMEOVER) {
    gameover();
  } else {
    println("Mode Error " + mode);
  }
}

import java.awt.Robot;

Robot rbt;
boolean skipFrame;

boolean wkey, akey, skey, dkey;
float eyeX, eyeY, eyeZ, focusX, focusY, focusZ, tiltX, tiltY, tiltZ;
float leftRightHeadAngle, upDownHeadAngle;

// Color Pallette
color white = #FFFFFF; // Empty Space
color black = #000000; // Stones
color green = #00FF00; // Planks
color dullBlue = #7092be; // Stone Walls

// Map Variables
int gridSize;
PImage map;
PImage stone, log, diamond;

void setup() {
  size(800, 600, P3D);
  fullScreen(P3D);
  textureMode(NORMAL);
  wkey = akey = skey = dkey = false;
  eyeX = width/2;
  eyeY = 9*height/10;
  eyeZ = 0;

  focusX = width/2;
  focusY = height/2;
  focusZ = 10;

  tiltX = 0;
  tiltY = 1;
  tiltZ = 0;
  leftRightHeadAngle = radians(270);
  noCursor();

  // Initialize Map Textures
  map = loadImage("map.png");
  stone = loadImage("Stone_Bricks.png");
  log = loadImage("Oak_Log_Side.png");
  diamond = loadImage("Diamond.png");
  gridSize = 100;

  try {
    rbt = new Robot();
  }
  catch(Exception e) {
    e.printStackTrace();
  }
  skipFrame = false;
}

void draw() {
  background(120, 167, 255);
  camera(eyeX, eyeY, eyeZ, focusX, focusY, focusZ, tiltX, tiltY, tiltZ);

  pointLight(255, 255, 255, eyeX, eyeY, eyeZ);
  //spotLight(255, 255, 255, eyeX, eyeY, eyeZ, focusX, focusY, focusZ, PI/2, 0.5);

  drawFloor(-2000, 2000, height, 100); // floor
  drawFloor(-2000, 2000, height-gridSize*4, 100); // ceiling

  //drawFocalPoint();
  //controlCamera();
  move();
  drawMap();
}

void drawMap() {
  for (int x = 0; x < map.width; x++) {
    for (int y = 0; y < map.height; y++) {
      color c = map.get(x, y);
      if (c == black || c == dullBlue) {
        texturedCube(x*gridSize-2000, height-gridSize, y*gridSize-2000, stone, gridSize);
        texturedCube(x*gridSize-2000, height-gridSize*2, y*gridSize-2000, stone, gridSize);
        texturedCube(x*gridSize-2000, height-gridSize*3, y*gridSize-2000, stone, gridSize);
      }
      if (c == green) {
        texturedCube(x*gridSize-2000, height-gridSize, y*gridSize-2000, log, gridSize);
        texturedCube(x*gridSize-2000, height-gridSize*2, y*gridSize-2000, log, gridSize);
        texturedCube(x*gridSize-2000, height-gridSize*3, y*gridSize-2000, log, gridSize);
      }
    }
  }
}

void move() {
  pushMatrix();
  translate(focusX, focusY, focusZ);
  sphere(5);
  popMatrix();

  if (wkey && canMoveForward() ) {
    eyeX = eyeX + cos(leftRightHeadAngle)*10;
    eyeZ = eyeZ + sin(leftRightHeadAngle)*10;
  }
  if (skey && canMoveBackwards() ) {
    eyeX = eyeX - cos(leftRightHeadAngle)*10;
    eyeZ = eyeZ - sin(leftRightHeadAngle)*10;
  }
  if (akey && canMoveLeft() ) {
    eyeX = eyeX - cos(leftRightHeadAngle + PI/2)*10;
    eyeZ = eyeZ - sin(leftRightHeadAngle + PI/2)*10;
  }
  if (dkey && canMoveRight() ) {
    eyeX = eyeX - cos(leftRightHeadAngle - PI/2)*10;
    eyeZ = eyeZ - sin(leftRightHeadAngle - PI/2)*10;
  }

  if (skipFrame == false) {
    leftRightHeadAngle = leftRightHeadAngle + (mouseX - pmouseX)*0.01;
    upDownHeadAngle = upDownHeadAngle + (mouseY - pmouseY)*0.01;
  }

  if (upDownHeadAngle > PI/2.5) upDownHeadAngle = PI/2.5;
  if (upDownHeadAngle < -PI/2.5) upDownHeadAngle = -PI/2.5;

  focusX = eyeX + cos(leftRightHeadAngle)*300;
  focusZ = eyeZ + sin(leftRightHeadAngle)*300;
  focusY = eyeY + tan(upDownHeadAngle)*300;

  if (mouseX < 2) {
    rbt.mouseMove(width-3, mouseY);
    skipFrame = true;
  } else if (mouseX > width-2) {
    rbt.mouseMove(3, mouseY);
    skipFrame = true;
  } else {
    skipFrame = false;
  }

  //if (mouseX > width-2) rbt.mouseMove(2, mouseY);
  //else if (mouseX < 2) rbt.mouseMove(width-2, mouseY);
}

boolean canMoveForward() {
  float fwdX, fwdY, fwdZ;
  float leftX, leftY, leftZ;
  float rightX, rightY, rightZ;
  
  int mapX, mapY;
  
  fwdX = eyeX + cos(leftRightHeadAngle)*200;
  fwdY = eyeY;
  fwdZ = eyeZ + sin(leftRightHeadAngle)*200;
  
  mapX = int(fwdX+2000) / gridSize;
  mapY = int(fwdZ+2000) / gridSize;
  
  if (map.get(mapX, mapY) == white) {
    return true;
  } else {
    return false;
  }
}

boolean canMoveBackwards(){
  float backX, backY, backZ;
  
  int mapX, mapY;
  
  backX = eyeX - cos(leftRightHeadAngle)*200;
  backY = eyeY;
  backZ = eyeZ - sin(leftRightHeadAngle)*200;
  
  mapX = int(backX+2000) / gridSize;
  mapY = int(backZ+2000) / gridSize;
  if (map.get(mapX, mapY) == white) {
    return true;
  }  else {
    return false;
  }

}

boolean canMoveLeft(){
  float leftX, leftY, leftZ;
  int mapX, mapY;
  
  leftX = eyeX - cos(leftRightHeadAngle+PI/2)*200;
  leftY = eyeY;
  leftZ = eyeZ - sin(leftRightHeadAngle+PI/2)*200;
  
  mapX = int(leftX+2000) / gridSize;
  mapY = int(leftZ+2000) / gridSize;
  if (map.get(mapX, mapY) == white) {
    return true;
  }  else {
    return false;
  }

}

boolean canMoveRight(){
  float rightX, rightY, rightZ;
  int mapX, mapY;
  
  rightX = eyeX + cos(leftRightHeadAngle+PI/2)*200;
  rightY = eyeY;
  rightZ = eyeZ + sin(leftRightHeadAngle+PI/2)*200;
  
  mapX = int(rightX+2000) / gridSize;
  mapY = int(rightZ+2000) / gridSize;
  if (map.get(mapX, mapY) == white) {
    return true;
  }  else {
    return false;
  }
}

void drawFloor(int start, int end, int level, int gap) {
  stroke(255);
  strokeWeight(1);
  int x = start;
  int z = start;

  while (z < end) {
    texturedCube(x, level, z, diamond, gap);
    x = x + gap;
    if (x >= end) {
      x = start;
      z = z + gap;
    }
  }
}

void keyPressed() {
  if (key == 'W' || key == 'w') wkey = true;
  if (key == 'A' || key == 'a') akey = true;
  if (key == 'S' || key == 's') skey = true;
  if (key == 'D' || key == 'd') dkey = true;
}

void keyReleased() {
  if (key == 'W' || key == 'w') wkey = false;
  if (key == 'A' || key == 'a') akey = false;
  if (key == 'S' || key == 's') skey = false;
  if (key == 'D' || key == 'd') dkey = false;
}

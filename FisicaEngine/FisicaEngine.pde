import fisica.*;

//palette
color blue   = color(29, 178, 242);
color blue2  = color(0, 0, 255);
color brown  = color(166, 120, 24);
color green  = color(74, 163, 57);
color red    = color(224, 80, 61);
color yellow = color(242, 215, 16);
color white = color(255);

color gravButtonStroke = white;

//assets
PImage redBird;
PImage earthPic;

// Cloud Variables
int cloudForm1, cloudForm2, cloudForm3;

// Button Variables
boolean gravButton, polyButton;
boolean mouseReleased;
boolean wasPressed;

FPoly blobbox;
FPoly topPlatform;
FPoly bottomPlatform;

//fisica
FWorld world;

void click() {
  mouseReleased = false;
  if (mousePressed) wasPressed = true;
  if (wasPressed && !mousePressed) {
    mouseReleased = true;
    wasPressed = false;
  }
}
//===========================================================================================

void setup() {
  //make window
  fullScreen();

  //load resources
  redBird = loadImage("red-bird.png");
  earthPic = loadImage("earth.png");

  //initialise world
  makeWorld();

  // Cloud Initalizer
  cloudForm1 = 500;
  cloudForm2 = 300;
  cloudForm3 = 0;

  //add terrain to world
  makeBlueBox();
  makeTopPlatform();
  makeBottomPlatform();
}

//===========================================================================================

void makeWorld() {
  Fisica.init(this);
  world = new FWorld();
  world.setGravity(0, 900);
}

//===========================================================================================

void makeTopPlatform() {
  topPlatform = new FPoly();

  //plot the vertices of this platform
  topPlatform.vertex(-100, height*.1);
  topPlatform.vertex(width*0.8, height*0.4);
  topPlatform.vertex(width*0.8, height*0.4+100);
  topPlatform.vertex(-100, height*0.1+100);

  // define properties
  topPlatform.setStatic(true);
  topPlatform.setFillColor(brown);
  topPlatform.setFriction(0.1);

  //put it in the world
  world.add(topPlatform);
}

//===========================================================================================

void makeBottomPlatform() {
  bottomPlatform = new FPoly();

  //plot the vertices of this platform
  bottomPlatform.vertex(width-50, height*0.8);
  bottomPlatform.vertex(width-50, height*0.6);
  bottomPlatform.vertex(width-70, height*0.6);
  bottomPlatform.vertex(width-70, height*0.825);
  bottomPlatform.vertex(width*0.9-100, height*0.825);
  bottomPlatform.vertex(width*0.9-100, height*0.825);
  bottomPlatform.vertex(width*0.9-80, height*0.825);
  bottomPlatform.vertex(width*0.9-80, height*0.6);
  bottomPlatform.vertex(width*0.9-100, height*0.6);
  bottomPlatform.vertex(width*0.9-100, height*0.825);
  bottomPlatform.vertex(width*0.9-100, height*0.8+70);
  bottomPlatform.vertex(width-50, height*0.8+70);

  // define properties
  bottomPlatform.setStatic(true);
  bottomPlatform.setFillColor(brown);
  bottomPlatform.setFriction(0);

  //put it in the world
  world.add(bottomPlatform);
}


//===========================================================================================

void makeCircle() {
  FCircle circle = new FCircle(50);
  circle.setPosition(random(width), -5);

  //set visuals
  circle.setStroke(0);
  circle.setStrokeWeight(2);
  circle.setFillColor(red);

  //set physical properties
  circle.setDensity(0.2);
  circle.setFriction(1);
  circle.setRestitution(1);

  //add to world
  world.add(circle);
}

//===========================================================================================

void makeBlob() {
  FBlob blob = new FBlob();

  //set visuals
  blob.setAsCircle(random(width), -5, 50);
  blob.setStroke(0);
  blob.setStrokeWeight(2);
  blob.setFillColor(yellow);

  //set physical properties
  blob.setDensity(0.2);
  blob.setFriction(1);
  blob.setRestitution(0.25);

  //add to the world
  world.add(blob);
}

void makeBlueBox() {
  FPoly bluebox = new FPoly();
  bluebox.setPosition(random(width), -5);

  //Verticies
  bluebox.vertex(10, 50);
  bluebox.vertex(60, 50);
  bluebox.vertex(60, 100);
  bluebox.vertex(10, 100);

  //set visuals
  bluebox.setStroke(0);
  bluebox.setStrokeWeight(2);
  bluebox.setFillColor(blue2);

  //set physical properties
  bluebox.setDensity(0.2);
  bluebox.setFriction(1);
  bluebox.setRestitution(0.25);

  world.add(bluebox);
}

//===========================================================================================

void makeEarth() {
  FCircle earth = new FCircle(48);
  earth.setPosition(random(width), -5);

  //set visuals
  earth.attachImage(earthPic);

  //set physical properties
  earth.setDensity(0.2);
  earth.setFriction(1);
  earth.setRestitution(0.25);
  world.add(earth);
}

//===========================================================================================

void makeBox() {
  FBox box = new FBox(25, 100);
  box.setPosition(random(width), -5);

  //set visuals
  box.setStroke(0);
  box.setStrokeWeight(2);
  box.setFillColor(green);

  //set physical properties
  box.setDensity(0.2);
  box.setFriction(1);
  box.setRestitution(2);
  world.add(box);
}

void makeBird() {
  FCircle bird = new FCircle(48);
  bird.setPosition(random(width), -5);

  //set visuals
  bird.attachImage(redBird);

  //set physical properties
  bird.setDensity(0.8);
  bird.setFriction(1);
  bird.setRestitution(0.5);
  world.add(bird);
}


void cloudForm1() {
  fill(255);
  stroke(255);
  ellipse(cloudForm1, 500, 300, 150);
  ellipse(cloudForm1+200, 550, 300, 150);
  ellipse(cloudForm1+90, 620, 300, 150);
  ellipse(cloudForm1-110, 590, 300, 150);
}

void cloudForm2() {
  fill(255);
  stroke(255);
  ellipse(cloudForm2, 900, 300, 150);
  ellipse(cloudForm2+200, 950, 300, 150);
  ellipse(cloudForm2+90, 1020, 300, 150);
  ellipse(cloudForm2-110, 990, 300, 150);
}

void cloudForm3() {
  fill(255);
  stroke(255);
  ellipse(cloudForm3, 100, 300, 150);
  ellipse(cloudForm3+200, 150, 300, 150);
  ellipse(cloudForm3+90, 220, 300, 150);
  ellipse(cloudForm3-110, 190, 300, 150);
}

void gravButton() {
  gravButton(550, 1227, 300, 150);
  textMode(CENTER);
  noFill();
  stroke(gravButtonStroke);
  strokeWeight(10);
  rect(550, 1227, 300, 150);
  textSize(90);
  text("Gravity", 565, 1330);
}

void gravButton (int x, int y, int w, int h) {
  if (mouseX > x && mouseX < x+w && mouseY > y && mouseY < y+h) {
    gravButtonStroke = red;
  } else {
    gravButtonStroke = white;
  }

  // mouseX > 550 && mouseX < 850 && mouseY > 1227 && mouseY < 1377
}

void mouseReleased() {
  if (mouseX > 550 && mouseX < 850 && mouseY > 1227 && mouseY < 1377) {
    world.setGravity(0, 10);
  } else {
    world.setGravity(0, 900);
  }
}

void draw() {
  //println("x: " + mouseX + " y: " + mouseY);
  background(blue);

  //Cloud Formations Back
  cloudForm2();
  cloudForm3();

  if (frameCount % 20 == 0) {  //Every 20 frames ...
    makeCircle();
    makeBlob();
    makeBlueBox();
    makeBox();
    makeBird();
    makeEarth();
  }
  world.step();  //get box2D to calculate all the forces and new positions
  world.draw();  //ask box2D to convert this world to processing screen coordinates and draw

  //Cloud Formations Front
  cloudForm1();

  //Buttons
  gravButton();

  // Cloud Mover
  // CF1
  cloudForm1 = cloudForm1 + 5;
  if (cloudForm1 > 3000) {
    cloudForm1 = -200;
  }

  cloudForm2 = cloudForm2 + 3;
  if (cloudForm2 > 3000) {
    cloudForm2 = -200;
  }

  cloudForm3 = cloudForm3 + 7;
  if (cloudForm3 > 3000) {
    cloudForm3 = -200;
  }
}

color black = #000000;
color white = #FFFFFF;

void game() {
  background(139, 79, 57);

  // DRAW GAME
  world.step();
  world.draw();

  // Score Counter
  fill(255);
  textMode(CENTER);
  textSize(100);
  text("Score: "+score, 830, 100);

  //Score Detector
  fill(255, 0, 255);
  rect(1420, 650, 310, 5);

  // Timer
  fill(144, 238, 144);
  textSize(40);
  text("Timer: "+timer, 100, 100);
}

void makeBarrier() {
  barrier = new FPoly();

  barrier.vertex(-10, 0);
  barrier.vertex(10000, 0);
  barrier.vertex(10000, 10);
  barrier.vertex(-10, 10);


  barrier.setGrabbable(false);
  barrier.setFill(255, 0, 0);
  barrier.setStatic(true);
  world.add(barrier);
}

void makeLeftBarrier() {
  leftBarrier = new FPoly();

  leftBarrier.vertex(-10, 0);
  leftBarrier.vertex(-10, 1500);
  leftBarrier.vertex(10, 1500);
  leftBarrier.vertex(10, 0);

  leftBarrier.setStatic(true);
  leftBarrier.setFill(255, 0, 0);
  leftBarrier.setGrabbable(false);
  world.add(leftBarrier);
}

void makeRightBarrier() {
  rightBarrier = new FPoly();

  rightBarrier.vertex(2010, 0);
  rightBarrier.vertex(2010, 1500);
  rightBarrier.vertex(1990, 1500);
  rightBarrier.vertex(1990, 0);

  rightBarrier.setStatic(true);
  rightBarrier.setFill(255, 0, 0);
  rightBarrier.setGrabbable(false);
  world.add(rightBarrier);
}

void makeHoop() {
  hoop = new FPoly();

  hoop.vertex(width/2+400, height/2);
  hoop.vertex(width/2+400, height/3);
  hoop.vertex(width/2+420, height/3);
  hoop.vertex(width/2+420, height/2);
  hoop.vertex(width/2+730, height/2);
  hoop.vertex(width/2+730, height/5);
  hoop.vertex(width/2+750, height/5);
  hoop.vertex(width/2+750, height/2);
  hoop.vertex(width/2+750, height/2+30);
  hoop.vertex(width/2+400, height/2+30);

  // Physical Properties Settings
  hoop.setStatic(true);
  hoop.setGrabbable(false);
  hoop.setFillColor(white);
  hoop.setFriction(0.7);

  world.add(hoop);
}

void makeGround() {
  ground = new FPoly();

  ground.vertex(0, height+100);
  ground.vertex(width/2+2100, height+100);
  ground.vertex(width/2+2100, height/2+300);
  ground.vertex(0, height/2+300);

  // Physical Properties Settings
  ground.setStatic(true);
  ground.setFillColor(black);
  ground.setFriction(1);
  ground.setGrabbable(false);

  world.add(ground);
}

// BASKETBALL
void makeBasketball() {
  basketball = new FCircle(100);
  basketball.setPosition(100, height/2);

  // Set Visuals
  basketball.attachImage(basketBall);

  // Physical Properties Settings
  basketball.setDensity(0.2);
  basketball.setFriction(1);
  basketball.setRestitution(1);

  world.add(basketball);
}

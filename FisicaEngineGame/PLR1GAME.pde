void plr1game() {

  background(139, 79, 57);

  // DRAW GAME
  world.step();
  world.draw();

  // p1Score Counter
  textMode(CENTER);
  textSize(100);
  fill(127.5);
  text("Score: "+p1Score, 835, 105);
  fill(0, 0, 255);
  text("Score: "+p1Score, 830, 100);
  
  if (timer1 == 0) {
    mode = LOBBY;
  }

  // Timer
  fill(timerColor);
  textSize(40);
  text("Timer: "+timer1, 100, 100);

  timerColor = green;
  timer1--;

  if (timer1 == 999) {
    invisDD = 0;
    invisSD = 255;
  } else if (timer1 == 599) {
    timerColor = yellow;
  } else if (timer1 == 399) {
    timerColor = red;
  } else if (timer1 < 99) {
    timer1 = 0;
    timer1 = timer1 + 0;
  }

  // Timer Cover
  noStroke();
  fill(139, 79, 57, invisDD);
  rect(255, 40, 100, 100); // Double Digits
  fill(139, 79, 57, invisSD);
  rect(238, 40, 100, 100); // Single Digit

  // Basketball Position Reseter
  if (rkey == true) {
    basketball1.setPosition(100, height/2);
    basketball1.setVelocity(0, 0);
  }
  
  collisionDetector2.setPosition(1000, 500);
  
  basketball2.setPosition(0, -100);
}

void makeBarrier1() {
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

void makeLeftBarrier1() {
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

void makeRightBarrier1() {
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


void makeHoop1() {
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

void makeCollisionDetector1() {
  collisionDetector1 = new FPoly();

  collisionDetector1 = new FPoly();
  collisionDetector1.vertex(width/2+420, height/2-10);
  collisionDetector1.vertex(width/2+730, height/2-10);
  collisionDetector1.vertex(width/2+730, height/2);
  collisionDetector1.vertex(width/2+420, height/2);


  collisionDetector1.setFillColor(blue);
  collisionDetector1.setGrabbable(false);
  collisionDetector1.setStatic(true);

  world.add(collisionDetector1);
}

void makeGround1() {
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
void makeBasketball1() {
  basketball1 = new FCircle(100);
  basketball1.setPosition(100, height/2);

  // Set Visuals
  basketball1.attachImage(basketBall);

  // Physical Properties Settings
  basketball1.setDensity(0.2);
  basketball1.setFriction(1);
  basketball1.setRestitution(1);

  world.add(basketball1);
}

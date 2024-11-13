void plr2game() {
  background(139, 79, 57);
  
  // DRAW GAME
  world.step();
  world.draw();

  // p2Score Counter
  textMode(CENTER);
  textSize(100);
  fill(127.5);
  text("Score: "+p2Score, 835, 105);
  fill(255, 0, 0);
  text("Score: "+p2Score, 830, 100);
  
  // Player 1 Score Display
  textSize(50);
  fill(127.5);
  text("Player 1 Score: "+p1Score, 833, 173);
  fill(0, 0, 255);
  text("Player 1 Score: "+p1Score, 830, 170);

  // Timer
  fill(timerColor);
  textSize(40);
  text("Timer: "+timer, 100, 100);
  
  timer--;
  
  if (timer == 999) {
    invisDD = 0;
    invisSD = 255;
  } else if (timer == 599){
    timerColor = yellow;
  } else if (timer == 399) {
    timerColor = red;
  } else if (timer < 99) {
    timer = 0;
    timer = timer + 0;
  }
  
  // Timer Cover
  noStroke();
  fill(139, 79, 57, invisDD);
  rect(255, 40, 100, 100); // Double Digits
  fill(139, 79, 57, invisSD);
  rect(238, 40, 100, 100); // Single Digit
  
  // Basketball Position Reseter
  if (rkey == true) {
    basketball2.setPosition(100, height/2);
    basketball2.setVelocity(0,0);
  }
  
  if (mode == PLR2GAME) {
    basketball1.setGrabbable(false);
    basketball1.setStatic(true);
    basketball1.setPosition(3000, 3000);
    
    collisionDetector1.setPosition(4000, 4000);
  }  
}

void makeBarrier2() {
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

void makeLeftBarrier2() {
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

void makeRightBarrier2() {
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


void makeHoop2() {
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

void makeCollisionDetector2() {
  collisionDetector2 = new FPoly();
  
  collisionDetector2 = new FPoly();
  collisionDetector2.vertex(width/2+420, height/2-10);
  collisionDetector2.vertex(width/2+730, height/2-10); 
  collisionDetector2.vertex(width/2+730, height/2);
  collisionDetector2.vertex(width/2+420, height/2);
  
  
  collisionDetector2.setFillColor(red);
  collisionDetector2.setGrabbable(false);
  collisionDetector2.setStatic(true);
  
  world.add(collisionDetector2);

}

void makeGround2() {
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
void makeBasketball2() {
  basketball2 = new FCircle(100);
  basketball2.setPosition(100, height/2);

  // Set Visuals
  basketball2.attachImage(basketBall);

  // Physical Properties Settings
  basketball2.setDensity(0.2);
  basketball2.setFriction(1);
  basketball2.setRestitution(1);

  world.add(basketball2);
}

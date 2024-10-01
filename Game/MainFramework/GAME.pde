void game() {
  timer--;
  
  background(0, 128, 0);

  //Soccer Field
  
  //Center
  noFill();
  stroke(255);
  strokeWeight(5);
  circle(750, 500, 400);
  line(750, 0, 750, 1505); // CENTER LINE
  fill(255);
  circle(750, 500, 30);

  //Left Side
  noFill();
  rectMode(CENTER);
  circle(200, 500, 300);
  fill(0, 128, 0);
  rect(-5, 500, 600, 700);
  rect(0, 500, 200, 300);
  fill(255);
  circle(200, 500, 20);
  
  
  //Right Side
  noFill();
  circle(1300, 500, 300);
  rectMode(CENTER);
  fill(0, 128, 0);
  rect(1505, 500, 600, 700);
  rect(1500, 500, 200, 300);
  fill(255);
  circle(1300, 500, 20);

  // Left Player
  strokeWeight(3);
  stroke(0);
  fill(135, 206, 235);
  circle(leftx, lefty, leftd);

  // Right Player
  fill(255, 127, 127);
  circle(rightx, righty, rightd);
  
  // Ball
  fill(255);
  strokeWeight(5);
  stroke(0);
  circle(ballx, bally, balld);
  
  //Ball Movement
  if (timer < 0) {
    ballx = ballx + vx;
    bally = bally + vy;
  }
  
  // Ball-Paddle Collisions
  //Ball Collision Left Paddle
  if (dist(leftx, lefty, ballx, bally) <= 100) {
    vx = (ballx - leftx)/15;
    vy = (bally - lefty)/15;
    
    println(vx);
    
  }

  // Ball Collision Right Paddle
  circle(ballx, bally, balld);
  if (dist(rightx, righty, ballx, bally) <= 100) {
    vx = (ballx - rightx)/15;
    vy = (bally - righty)/15;
  }
  
  // ---------- \\
  
  // Movement
  // Left Paddle
  if (wkey == true) lefty = lefty - 3;
  if (skey == true) lefty = lefty + 3;
  if (dkey == true) leftx = leftx + 3;
  if (akey == true) leftx = leftx - 3 ;
  
  // Movement
  // Right Paddle
  if (upkey == true) righty = righty - 3;
  if (downkey == true) righty = righty + 3;
  if (rightkey == true) rightx = rightx + 3;
  if (leftkey == true) rightx = rightx - 3 ;
  
  
  // Ball Boundry Restrictor
  // X Cord.
    if (ballx >= 1500) {
    ballx = 1500;
  }
  
  if (ballx <= 0) {
    ballx = 0;
  } 
  
  // Y Cord.
  if (bally >= 1000) {
    bally = 1000;
  }
  
  if (bally <= 0) {
    bally = 0;
  } 
  
    // Ball Collision
    if (bally <= balld/2 || bally >= height-balld/2) {
      vy = vy * -1;
    }

    if (ballx <= balld/2 || ballx >= width-balld/2) {
      vx = vx * -1;
    }
  
}

void gameClicks() {
}

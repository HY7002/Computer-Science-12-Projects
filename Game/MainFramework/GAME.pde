void game() {
  timer--;

  background(0, 128, 0);

  //Scoreboard
  textSize(70);
  fill(135, 206, 235);
  text(leftscore, width/4, 100);
  fill(255, 127, 127);
  text(rightscore, 3*width/4, 100);
  fill(0);

  //Pause Button
  fill(255, 255, 255, 0);
  stroke(255);
  circle(1450, 50, 70);
  fill(255);
  textSize(50);
  text("I I", 1432, 66);


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

  // Left Goal
  noStroke();
  fill(255, 255, 255, 50);
  rect(30, height/2, 80, 250);

  // Right Goal
  rect(1465, height/2, 80, 250);

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
  stroke(contactColor);
  circle(ballx, bally, balld);

  //Ball Movement
  if (timer < 0) {
    ballx = ballx + vx;
    bally = bally + vy;

    vx = vx * 0.98;
    vy = vy * 0.98;
  }

  // Ball-Paddle Collisions
  //Ball Collision Left Paddle
  if (dist(leftx, lefty, ballx, bally) <= 100) {
    vx = (ballx - leftx)/15;
    vy = (bally - lefty)/15;
    
    contactColor= #87CEEB;
  }
  
  // Ball Collision Right Paddle
  circle(ballx, bally, balld);
  if (dist(rightx, righty, ballx, bally) <= 100) {
    vx = (ballx - rightx)/15;
    vy = (bally - righty)/15;
    
    contactColor= #FF7F7F;
  }

  // ---------- \\

  // Movement
  // Left Paddle
  if (wkey == true) lefty = lefty - 5;
  if (skey == true) lefty = lefty + 5;
  if (dkey == true) leftx = leftx + 5;
  if (akey == true) leftx = leftx - 5;

  // Movement
  // Right Paddle
  if (upkey == true) righty = righty - 5;
  if (downkey == true) righty = righty + 5;
  if (rightkey == true) rightx = rightx + 5;
  if (leftkey == true) rightx = rightx - 5;

  // ---------- \\

  // Score
  // Right Score
  if (ballx < 100 && bally <= height/2) {
    rightscore++;

    // Ball Reset
    ballx = width/2;
    bally = height/2;
    vx = 0;
    vy = 0;
    contactColor = #000000;

    // Left Player Reset
    leftx = 100;
    lefty = height/2;

    // Right Player Reset
    rightx = 1400;
    righty = height/2;
  }

  // Left Score
  if (ballx > 1400 && bally >= height/2) {
    leftscore++;

    // Ball Reset
    ballx = width/2;
    bally = height/2;
    vx = 0;
    vy = 0;
    contactColor = #000000;

    // Left Player Reset
    leftx = 100;
    lefty = height/2;

    // Right Player Reset
    rightx = 1400;
    righty = height/2;
  }

  // Winnner Handler
    // Right Wins
    if (rightscore == 3) {
      mode = GAMEOVER;
      redWins = 255;
      blueWins = 0;
    }
    
    // Left Wins
    if (leftscore == 3) {
      mode = GAMEOVER;
      blueWins = 255;
      redWins = 0;
    }

  // ---------- \\

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

  // ---------- \\

  // Ball Collision
  if (bally <= balld/2 || bally >= height-balld/2) {
    vy = vy * -1;
  }

  if (ballx <= balld/2 || ballx >= width-balld/2) {
    vx = vx * -1;
  }
}

void gameClicks() {
  if (dist(mouseX, mouseY, 1450, 50) < 70) {
    mode = PAUSE;
  } else {
    mode = GAME;
  }
}

color winnerbox;

void gameover() {
  background(55);

  rectMode(CENTER);
  stroke(255);
  strokeWeight(10);
  fill(255, 0, 0);
  rect(width/2, height/2-130, 500, 150, 100);
  fill(255);
  textMode(CENTER);
  textSize(70);
  text("GAME OVER", width/2-175, height/2-105);

  // Winner Box
  noFill();
  stroke(winnerbox);
  strokeWeight(3);
  rect(width/2, 525, 350, 100);

  if (leftscore == 3) {
    winnerbox = color(135, 206, 235);
  }
  if (rightscore == 3) {
    winnerbox = color(255, 0, 0);
  }

  // Blue Wins
  fill(135, 206, 235, blueWins);
  text("BLUE WINS!", 580, height/2+50);

  // Red Wins
  fill(255, 0, 0, redWins);
  text("RED WINS!", 600, height/2+50);

  // Score Board
  // Right Side
  fill(135, 206, 235);
  text(leftscore, width/2-100, height/2+150);

  // Left Scire
  fill(255, 0, 0);
  text(rightscore, width/2+70, height/2+150);

  //Separator
  fill(255);
  text("---", width/2-30, height/2+147);

  // Reset Game
  textSize(30);
  text("Press R to Reset", 660, height/2+200);

  if (rkey == true) {
    mode = INTRO;

    // Reset Score
    leftscore = 0;
    rightscore = 0;

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
}

void gameoverClicks() {
}

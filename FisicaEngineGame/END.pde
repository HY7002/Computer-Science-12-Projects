void end() {
  background(19, 24, 98);

  textSize(100);
  fill(255, 255, 255, 100);
  text("GAME OVER", 735, 405);
  fill(255);
  text("GAME OVER", 730, 400);
  stroke(255);
  line(570, 450, 1400, 450);

  textSize(50);
  fill(0 );
  text("Player 1: "+p1Score, 873, 553);
  fill(0, 0, 255);
  text("Player 1: "+p1Score, 870, 550);
  
  fill(0);
  text("Player 2: "+p2Score, 873, 653);
  fill(255, 0, 0);
  text("Player 2: "+p2Score, 870, 650);
  
  line(570, 730, 1400, 730);
  
  // Winner Handler
  if (p1Score > p2Score) {
    textSize(100);
    fill(0, 0, 255);
    text("Player 1 Wins!", 730, 1000);
  } if (p1Score < p2Score) {
    textSize(100);
    fill(255, 0, 0);    
    text("Player 2 Wins!", 730, 1000);
  } if (p1Score == p2Score) {
    textSize(100);
    fill(255, 255, 255, 127);    
    text("Tie Game", 783, 903);    
    
    fill(255);    
    text("Tie Game", 780, 900);
  }
  
  fill(255);
  textSize(30);
  text("Press Spacebar to Restart", 830, 1200);
  
// GAME REST  
  if (spacekey == true) {
    mode = INTRO;
    
    timer1 = 1100;
    timer2 = 1100;
    
    p1Score = 0;
    p2Score = 0;
    
    basketball1.setPosition(100, height/2);
    basketball1.setVelocity(0,0);
    
    collisionDetector1.setPosition(0,0);
    
    invisDD = 255;
    invisSD = 0;
    invisDD2 = 225;
    invisSD2 = 0;
  }
}

void endClicks() {
}

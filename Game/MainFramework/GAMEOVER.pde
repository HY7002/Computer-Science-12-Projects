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
  
  // Blue Wins
  fill(135, 206, 235);
  text("BLUE WINS!", width/2, height/2);
}

void gameoverClicks() {
}

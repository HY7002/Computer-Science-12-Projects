color bpStroke;
color textStroke;

void intro() {
  background(127);
  
  textSize(150);
  
  fill(0, 127);
  text("NBA", 705, 505);
  fill(0);
  text("NBA", 700, 500);

  fill(254, 87, 87, 127);
  text("5K", 960, 505);  
  fill(255, 0, 0);
  text("5K", 955, 500);
  
  fill(255);
  text("42", 1120, 500);
  fill(255, 127);
  text("42", 1125, 505);
  
  strokeWeight(10);
  stroke(255);
  line(500, 550, 1500, 550);
  
  stroke(0);
  line(800, 550, 1500, 550);  
  
  stroke(255, 0, 0);
  line(1200, 550, 1500, 550); 
  
  
  textSize(50);
  fill(255);
  text("Æ Sports", 900, 650);
  
  playButton(850, 800, 300, 100);
  stroke(bpStroke);
  noFill();
  rect(850, 800, 300, 100);
  textSize(80);
  fill(textStroke);
  text("PLAY", 915, 880);
}


void playButton(int x, int y, int w, int h) {
  if (mouseX >= x && mouseX <= x+w && mouseY >= y && mouseY <= y+h) {
    bpStroke = white;
    textStroke = blue;
  } else {
    bpStroke = blue;
    textStroke = white;
  }
}

void introClicks() {
  if (mouseX > 850 && mouseX < 1150 && mouseY > 800 && mouseY < 900) {
    mode = PLR1GAME;
  }
}

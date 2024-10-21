color white = color(255);
color green = color(0, 128, 0);

color playButtonHover;
color playButtonReg;
color playButtonText;

void intro() {
  rectMode(CORNER);
  background(135, 206, 235);
  stroke(135, 206, 235);
  fill(0, 128, 0);
  rect(-5, 700, 1600, 1000);

  // Ball Motion Blur
  stroke(0, 0, 0, 50);
  fill(255, 255, 255, 50);
  circle(600, 625, 100);
  stroke(0, 0, 0, 100);
  fill(255, 255, 255, 100);
  circle(670, 625, 130);

  // Ball
  fill(255);
  stroke(0);
  strokeWeight(5);
  circle(width/2, 625, 150);

  // Text
  textMode(CENTER);
  textSize(100);
  text("DLS Remastered 4K HDR RTX", 150, 300);
  textSize(50);
  text("Æ Games", 650, 370);
  stroke(255);
  line(104, 320, 1400, 320);

  // Play Button
  stroke(0);
  fill(0);
  playButtonSelect(700, 830, 300, 90);
  rectMode(CENTER);
  fill(playButtonHover);
  rect(width/2+20, 850, 300, 90);
  fill(playButtonReg);
  rect(width/2, 830, 300, 90);

  fill(playButtonText);
  textSize(80);
  textMode(CENTER);
  text("PLAY", 665, 855);
}

// Play Button Function
void playButtonSelect (int x, int y, int w, int h) {
  if (mouseX >= x && mouseX <= x+w && mouseY >= y && mouseY <= y+h) {
    playButtonHover = white;
    playButtonReg = green;
    playButtonText = white;
  } else {
    playButtonHover = green;
    playButtonReg = white;
    playButtonText = green;
  }
}

void introClicks() {
  if (mouseX > 700 && mouseX < 1000 && mouseY > 830 && mouseY < 920) {
    mode = GAME;
  }
}

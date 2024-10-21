void pause() {
  fill(255, 1);
  noStroke();
  rectMode(CENTER);
  rect(750, 500, 1550, 1550);

  fill(0, 7);
  textMode(CENTER);
  textSize(100);
  text("MATCH PAUSED", 460, height/2+10);
  fill(255);
  textSize(100);
  text("MATCH PAUSED", 450, height/2);
}

void pauseClicks() {
  if (mouseX > 750 && mouseX < 800 && mouseY > 500 && mouseY < 1050) {
    mode = GAME;
  }
}

color plr2ButtonHover;
color plr2ButtonReg;

void lobby() { 
  background(0);
  
  textSize(100);
  fill(155);
  text("AWAITING PLAYER 2", 555, 505);  
  fill(255);
  text("AWAITING PLAYER 2", 550, 500);
  
  // Button
  textSize(40);
  strokeWeight(10);
  stroke(plr2ButtonHover);
  fill(0);
  plr2Button(770, 640, 400, 100);
  rect(770, 640, 400, 100, 100);
  fill(255);
  text("Continue to Player 2", 800, 700);
  
  // PLR1 Final Score
  textSize(50);
  fill(255);
  text("Player 1 Final Score: "+p1Score, 752, 1002); 
  fill(0, 0, 255);
  text("Player 1 Final Score: "+p1Score, 750, 1000); 

}

void plr2Button(int x, int y, int w, int h) {
  if (mouseX >= x && mouseX <= x+w && mouseY >= y && mouseY <= y+h) {
    plr2ButtonHover = green;
  } else {
    plr2ButtonHover = white;
  }
}

void lobbyClicks() {
  if (mouseX > 770 && mouseX < 1170 && mouseY > 640 && mouseY < 740) {
    mode = PLR2GAME;
  }
}

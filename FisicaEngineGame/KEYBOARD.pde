void keyPressed() {
  // Reset Ball Pos. Key
  if(key == 'r' || key == 'R') rkey = true;
  if(keyCode == ' ') spacekey = true;
}

void keyReleased() {
  // Reset Ball Pos.
  if(key == 'r' || key == 'R') rkey = false;
  if(keyCode == ' ') spacekey = false;
}

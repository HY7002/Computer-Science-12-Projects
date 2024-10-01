void keyPressed() {
  // Left Player
  if(key == 'w' || key == 'W') wkey = true;
  if(key == 's' || key == 'S') skey = true;
  if(key == 'd' || key == 'D') dkey = true;
  if(key == 'a' || key == 'A') akey = true;
  
  // Right Player
  if(keyCode == UP) upkey = true;
  if(keyCode == DOWN) downkey = true;
  if(keyCode == RIGHT) rightkey = true;
  if(keyCode == LEFT) leftkey = true;
}

void keyReleased() {
  // Left Player
  if(key == 'w' || key == 'W') wkey = false;
  if(key == 's' || key == 'S') skey = false;
  if(key == 'd' || key == 'D') dkey = false;
  if(key == 'a' || key == 'A') akey = false;
  
  // Right Player
  if(keyCode == UP) upkey = false;
  if(keyCode == DOWN) downkey = false;
  if(keyCode == RIGHT) rightkey = false;
  if(keyCode == LEFT) leftkey = false;
}

void mouseReleased() {
  if (mode == LOBBY) {  
    lobbyClicks();
  }
  
  if (mode == END) {
    endClicks();
  }
  
  if (mode == INTRO) {
    introClicks();
  }
}

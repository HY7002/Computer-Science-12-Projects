class FPlayer extends FBox {
  FPlayer() {
    super(gridSize, gridSize);
    setPosition(300, 0);
    setFillColor(blue);
  }

  void act() {
    if (dkey) setVelocity(150, getVelocityY());
    if (akey) setVelocity(-150, getVelocityY());
    
    if (wkey) setVelocity(getVelocityX(), 5000);
  }
}

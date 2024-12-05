class FPlayer extends FGameObject {
  
  FPlayer() {
    super();
    setPosition(300, 0);
    setFillColor(blue);
    setName("player");
    setRotatable(false);
  }

  void act() {
    handleInput();
    if (isTouching("spike")) {
      setPosition(310,-10);
      setVelocity(0,0);
    }
  }
  
  void handleInput() {
    float vx = getVelocityX();
    float vy = getVelocityY();
    if (dkey) setVelocity(150, vy);
    if (akey) setVelocity(-150, vy);
    if (wkey) setVelocity(vx, -250);
  }
}

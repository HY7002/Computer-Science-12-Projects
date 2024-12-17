class FThwomp extends FGameObject {
  
  int frame;
  
  FThwomp(float x, float y) {
    super();
    setPosition(x, y);
    setName("thwomp");
    setRotatable(false);
    setStatic(true);
    
    println(x, y);
  }
  
  void act() {
    animate();
    collide();
  }
  
  void animate() {
    if (player.getX() <= 32 && player.getY() >= 160) {
      setStatic(false);
      attachImage(wake[frame]);
    } else {
      attachImage(sleep[frame]);
    }
  }
  
  void collide() {
    if (isTouching("player")) {
      if (player.getY() < getY()-gridSize/2) {
        world.remove(this);
        enemies.remove(this);
      } else {
        player.setPosition(300, 0);
      }
    }    
  }
}

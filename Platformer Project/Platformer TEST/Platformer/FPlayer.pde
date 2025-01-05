int x, y;

class FPlayer extends FGameObject {
  
  int frame;
  int direction;
  final int L = -1;
  final int R = 1;

  FPlayer() {
    super();
    direction = R;
    setPosition(300, 0);
    setFillColor(blue);
    setName("player");
    setRotatable(false);
  }

  void act() {
    handleInput();
    collisions();
    input();
  }

  void handleInput() {
    float vx = getVelocityX();
    float vy = getVelocityY();
    if (dkey) setVelocity(150, vy);
    if (akey) setVelocity(-150, vy);
    if (wkey) setVelocity(vx, -250);
  }

  void collisions() {
    if (isTouching("spike")) {
      setPosition(310, -10);
      setVelocity(0, 0);
    }
    
    if (isTouching("invisBarrier")) {
      loadWorld(lobby);      
      loadPlayer();
      player.setPosition(33, 927);
    }
  }

  void input() {
    float vx = getVelocityX();
    float vy = getVelocityY();
    if (abs(vy) < 0.1) {
    }
    
    if (akey) {
      setVelocity(-200, vy);
      direction = L;
    }
    if (dkey) {
      setVelocity(200, vy);
      direction = R;
    }
    if (wkey) {
      setVelocity(vx, -250);
    }
     if (spaceBar) {
      println(getX(), getY());
    }
  }
}

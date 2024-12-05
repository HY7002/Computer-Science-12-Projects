class FGoomba extends FGameObject {
  int direction = L;
  int speed = 50;
  int frtame = 0;
  
  FGoomba(float x, float y) {
    super();
    setPosition(x, y);
    setName("goomba");
    setRotatable(false);
  }
}

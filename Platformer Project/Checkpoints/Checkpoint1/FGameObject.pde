class FGameObject extends FBox {
  FGameObject() {
    super(gridSize, gridSize);
  }
  
  void act() {
  
  }
  
  boolean isTouching(String n) {
    ArrayList<FContact> contacts = getContacts();
    for (int i = 0; i < contacts.size(); i++) {
      FContact fc = contacts.get(i);
      if (fc.contains(n)) {
        setPosition(310,1);
        setVelocity(0,0);
      }
    }
    return false;
  }  
}

class Mover {
  //instance variables
  float x, y;
  float d;
  
  //constructor
  Mover() {
    x = width/2;
    y = width/2;
    
    d = random(50, 200);
  }
  
  //behaviour functions
  void show() {
    strokeWeight(5);
    stroke(255);
    fill(0);
    circle(x, y, d);
  }
  
  void act() {
    x = x + random(-5, 5);
    y = y + random(-5, 5);
  }
}

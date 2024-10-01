class Mover {
  //instance variables
  float x, y;
  
  //constructor
  Mover() {
    x = width/2;
    y = width/2;
  }
  
  //behaviour functions
  void show() {
    strokeWeight(5);
    stroke(255);
    fill(random(255), random(255), random(255));
    circle(x, y, 150);
  }
  
  void act() {
    x = x + random(-5, 5);
    y = y + random(-5, 5);  
  }
}

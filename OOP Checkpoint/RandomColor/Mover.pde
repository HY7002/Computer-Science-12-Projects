class Mover {
  //instance variables
  float x, y;
  float r = random(1, 255);
  float g = random(1, 255);
  float b = random(1, 255);
  
  //constructor
  Mover() {
    x = width/2;
    y = width/2;
  }
  
  //behaviour functions
  void show() {
    strokeWeight(5);
    noStroke();
    fill(r, g, b);
    circle(x, y, 150);
  }
  
  void act() {
    x = x + random(-5, 5);
    y = y + random(-5, 5);  
  }
}

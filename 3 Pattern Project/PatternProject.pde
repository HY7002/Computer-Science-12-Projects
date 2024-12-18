int patternSelect = 0;
int pt1x = -20;
int pt2s;
int pt3s;

// Button Ints
int buttonX = 900;
int buttonY = 900;
int buttonR = 100;

void setup() {
  size(1000, 1000);

  drawPattern();
}

void draw() {
  button();
}

void button() {

  if (dist(buttonX, buttonY, mouseX, mouseY) < buttonR/2) {
    stroke(0, 255, 0);
  } else {
    stroke(255, 0, 0);
  }

  strokeWeight(5);
  fill(0);
  circle(buttonX, buttonY, buttonR);
  textAlign(CENTER);
  textSize(100);
  fill(255);
  text(">", buttonX+3, buttonY+33, buttonR);
}

void drawPattern() {
  background(0);

  if (patternSelect == 0) {
    while (pt1x < 1000) {
      pattern1(pt1x, -55);
      pattern1(pt1x, 195);
      pattern1(pt1x, 445);
      pattern1(pt1x, 695);

      pt1x = pt1x + 250;
    }
  } else if (patternSelect == 1) {
    while (pt2s < 1000) {
      pattern2(500, 500, pt2s);

      pt2s = pt2s + 1;
    }
  } else if (patternSelect == 2) {
    while (pt3s < 1000) {
      pattern3(500, 500, pt3s);

      pt3s = pt3s + 1;
    }
  }
}

void pattern1(int x, int y) {
  pushMatrix();
  translate(x, y);
  scale(random(.5));

  stroke(random(255), random(255), random(255));
  strokeWeight(50);
  line(300, 200, 700, 200);
  line(300, 200, 100, 500);
  line(700, 200, 900, 500);
  line(100, 500, 100, 700);
  line(900, 500, 900, 700);
  line(100, 700, 300, 1000);
  line(900, 700, 700, 1000);
  line(300, 1000, 700, 1000);
  line(300, 1000, 700, 1000);
  line(300, 200, 700, 200);

  popMatrix();
}

void pattern2(int x, int y, int s) {
  pushMatrix();
  translate(x, y);
  rotate(random(180));
  stroke(random(255), random(255), random(255));
  scale(s);

  rectMode(CENTER);
  strokeWeight(1);
  noFill();
  rect(0, 0, 100, 100);

  popMatrix();
}

void pattern3(int x, int y, int s) {
  pushMatrix();
  translate(x, y);
  stroke(255);
  strokeWeight(3);
  scale(s);
  noFill();
  stroke(random(255), random(255), random(255));
  rotate(random(5));

  arc(0, 0, 100, 100, 0, QUARTER_PI + HALF_PI);

  popMatrix();
}

void mousePressed() {
  if (dist(buttonX, buttonY, mouseX, mouseY) < buttonR/2) {
    patternSelect++;
    if (patternSelect == 3) {

      patternSelect = 0;
    }
    
    drawPattern();
    
    pt1x = -20;
    pt2s = 0;
    pt3s = 0;
    
    println(patternSelect);
  }
}

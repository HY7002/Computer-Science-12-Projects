// Hanson Yu
// Sept 9th, 2024

void setup() {
  size(2500, 1300);
  background(135, 206, 235);
}

void draw() {
  car(1000, 650);
  wheelR(2100, 690);
  wheelF(600, 690);
  
  //Ground
  rect(1500, 1095, 3000, 500);
}

void car(int x, int y) {
  pushMatrix();
  translate(x, y);

  chassis();
  Rwing();
  Fwing();

  popMatrix();
}

void wheelR(int x, int y) {
  pushMatrix();
  translate(x, y);

  stroke(50);
  strokeWeight(10);
  fill(0);
  circle(0, 0, 300);
  strokeWeight(0);
  stroke(0);
  fill(255, 0, 0);
  circle(0, 0, 250);
  fill(0);
  circle(0, 0, 220);
  fill(0);
  rectMode(CENTER);
  rect(0, 0, 100, 250);
  fill(0);
  rect(0, 0, 170, 60);
  rect(0, 0, 170, 60);
  fill(255, 30, 0);
  circle(0, 0, 180);
  fill(0);
  circle(0, 0, 170);
  fill(125);
  circle(0, 0, 100);

  popMatrix();
}

void Fwing() {
  fill(0);
  rect(-850, 20, 15, 130);

  rect(-800, 20, 15, 130);

  rect(-935, 120, 250, 50);
}

void Rwing() {
  fill(0);
  rect(1110, -200, 10, 150);

  rect(975, -210, 145, 10);

  rect(975, -340, 10, 130);

  rect(975, -350, 385, 10);

  rect(1350, -350, 10, 400);

  rect(1155, 40, 195, 10);
}

void wheelF(int x, int y) {
  pushMatrix();
  translate(x, y);

  stroke(50);
  strokeWeight(10);
  fill(0);
  circle(0, 0, 300);
  strokeWeight(0);
  stroke(0);
  fill(255, 0, 0);
  circle(0, 0, 250);
  fill(0);
  circle(0, 0, 220);
  fill(0);
  rectMode(CENTER);
  rect(0, 0, 100, 250);
  fill(0);
  rect(0, 0, 170, 60);
  rect(0, 0, 170, 60);
  fill(255, 30, 0);
  circle(0, 0, 180);
  fill(0);
  circle(0, 0, 170);
  fill(125);
  circle(0, 0, 100);

  popMatrix();
}

void chassis() {

  rectMode(CORNER);

  fill(0);
  rect(350, -305, 300, 10);

  rect(350, -215, 100, 10);

  rect(340, -305, 10, 100);

  rect(395, -205, 10, 65);

  rect(200, -150, 300, 10);

  rect(200, -150, 10, 100);

  rect(-950, -50, 1160, 10);

  rect(-950, -50, 10, 70);

  rect(-950, 10, 941, 10);

  rect(-19, 10, 10, 130);

  rect(-19, 130, 1000, 10);

  pushMatrix();
  rotate(6.7);
  rect(470, -540, 475, 10);
  popMatrix();
}

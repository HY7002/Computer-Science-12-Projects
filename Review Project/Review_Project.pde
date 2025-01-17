// Hanson Yu
// Sept 5th, 2024

// Colors
color yellow = #ffff00;
color bgcolor = #87ceeb;
color smcolor = yellow;
color windowcolor = #87ceeb;

// Floats
float sunX;
float moonX;

void setup() {
  size(1500, 1000);
  background(bgcolor);

  sunX = -10;
  moonX = -70;
  
}

void draw() {

  strokeWeight(5);
  //Ground
  fill(0, 128, 0); // ground color
  rect(-5, 500, 2000, 700); // ground

  //Pavement
  fill(100);
  triangle(750, 100, -100, 1001, 1590, 1001);
  fill(0);

  //Sky
  fill(bgcolor);
  stroke(bgcolor);
  rect(-5, -1, 2000, 500);

  //Sun
  stroke(0);
  fill(yellow);
  circle(sunX, 100, 100);
  sunX = sunX + 5;

  if (sunX == 1550) {
    sunX = 5000;
    bgcolor = #041A40;
  }

  //Moon
  strokeWeight(0);
  fill(246, 241, 213, 100); // outer glow big
  circle(moonX, 100, 160);
  
  fill(246, 241, 213, 150);
  circle(moonX, 100, 130); // outer glow smol
  
  strokeWeight(1);
  
  fill(246, 241, 213);
  circle(moonX, 100, 100); // core

  if (sunX >= 1550) {
    moonX = moonX + 5;
    bgcolor = #041A40;
  } else {
    moonX = -80;
  }
  
  if (moonX >= 1550) {
    bgcolor = #87ceeb;
    sunX = -10;
    sunX = sunX + 3;
  }
  
  if (moonX >= -50) {
    windowcolor = yellow;
  } else {
    windowcolor = #87ceeb;
  }
  
  stroke(0);
  strokeWeight(5);

  //Chimmney
  fill(69);
  rect(600, 120, 50, 150);

  //House
  fill(193, 74, 9);
  rect(700, 420, 470, 230); // garage

  fill(169);
  rect(750, 450, 300, 200); // garage gate
  line(750, 500, 1050, 500);
  line(750, 550, 1050, 550);
  line(750, 600, 1050, 600);

  fill(193, 74, 9);
  rect(300, 300, 400, 350); // main building

  fill(255);
  rect(450, 500, 100, 150); // door
  strokeWeight(3);

  fill(windowcolor);
  rect(480, 520, 40, 40); // door window
  fill(255);
  circle(533, 580, 10); // doorknob

  strokeWeight(5);

  fill(windowcolor);
  rect(350, 350, 100, 100); // Left window
  rect(550, 350, 100, 100); // Right window

  line(550, 400, 650, 400); // Lwindow frame horitzontal
  line(600, 450, 600, 350); // Lwindow frame verticle

  line(350, 400, 450, 400); // Rwindow frame horitzontal
  line(400, 450, 400, 350); // Rwindow frame verticle

  //Roof
  fill(69);
  triangle(500, 90, 302, 300, 699, 300); // main building roof

  triangle(1005, 303, 1005, 420, 1167, 420); // garage roof triangle

  rect(700, 302, 305, 118); // garage rect roof

  //Trees
  // Left Tree
  fill(107, 73, 43);
  rect(100, 350, 50, 300);
  fill(42, 126, 25);
  circle(125, 350, 200);
  // Right Tree
  fill(107, 73, 43);
  rect(1300, 350, 50, 300);
  fill(42, 126, 25);
  circle(1325, 350, 200);
}

float rotx, roty, rotz;

void setup() {
  size(800, 800, P3D);

}

void draw() {
  background(255);
  translate(width/2, height/2, 0);

  rotateX(rotx);
  rotateY(roty);
  fill(0,0,255);
  stroke(0,0,0);
  strokeWeight(3);
  sphere(200);
  
  
  //cube(width/2, height/2, 0, #FF0000, 200);
  //cube(0, 0, 0, #0000ff, 200);

}
void cube(float x, float y, float z, color c, float size) {
  pushMatrix();
  translate(x, y, z);

  rotateX(rotx);
  rotateY(roty);
  //rotateZ();
  fill(c);
  stroke(0);
  strokeWeight(5);
  box(size); // side length
  popMatrix();
}
void mouseDragged() {
  rotx = rotx + (pmouseY - mouseY)*0.01;
  roty = roty + (pmouseX - mouseX)*-0.01;

}

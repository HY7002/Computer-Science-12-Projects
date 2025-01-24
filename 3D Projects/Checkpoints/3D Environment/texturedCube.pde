void texturedCube(float x, float y, float z, PImage texture, float size) {
  pushMatrix();
  translate(x, y, z);
  scale(size);
  noStroke();
  
    beginShape(QUADS);
  texture(texture);

  // Top
  vertex(0, 0, 0, 0, 0);
  vertex(1, 0, 0, 1, 0);
  vertex(1, 0, 1, 1, 1);
  vertex(0, 0, 1, 0, 1);

  // Bottom
  vertex(0, 1, 0, 0, 0);
  vertex(1, 1, 0, 1, 0);
  vertex(1, 1, 1, 1, 1);
  vertex(0, 1, 1, 0, 1);

  // Front
  vertex(0, 0, 1, 0, 0);
  vertex(1, 0, 1, 1, 0);
  vertex(1, 1, 1, 1, 1);
  vertex(0, 1, 1, 0, 1);

  // Back
  vertex(1, 0, 0, 0, 0);
  vertex(0, 0, 0, 1, 0);
  vertex(0, 1, 0, 1, 1);
  vertex(1, 1, 0, 0, 1);

  // Left
  vertex(0, 0, 0, 0, 0);
  vertex(0, 0, 1, 1, 0);
  vertex(0, 1, 1, 1, 1);
  vertex(0, 1, 0, 0, 1);

  // Right
  vertex(1, 0, 0, 0, 0);
  vertex(1, 0, 1, 1, 0);
  vertex(1, 1, 1, 1, 1);
  vertex(1, 1, 0, 0, 1);

  endShape();

  popMatrix();

}

void texturedCube(float x, float y, float z, PImage top, PImage bottom, PImage side, float size) {
  pushMatrix();
  translate(x, y, z);
  scale(size);
  noStroke();

  beginShape(QUADS);
  texture(top);

  // Top
  vertex(0, 0, 0, 0, 0);
  vertex(1, 0, 0, 1, 0);
  vertex(1, 0, 1, 1, 1);
  vertex(0, 0, 1, 0, 1);
  endShape();
  
  
  beginShape(QUADS);
  texture(bottom);
  // Bottom
  vertex(0, 1, 0, 0, 0);
  vertex(1, 1, 0, 1, 0);
  vertex(1, 1, 1, 1, 1);
  vertex(0, 1, 1, 0, 1);
  endShape();
  
  beginShape(QUADS);
  texture(side);
  // Front
  vertex(0, 0, 1, 0, 0);
  vertex(1, 0, 1, 1, 0);
  vertex(1, 1, 1, 1, 1);
  vertex(0, 1, 1, 0, 1);

  // Back
  vertex(1, 0, 0, 0, 0);
  vertex(0, 0, 0, 1, 0);
  vertex(0, 1, 0, 1, 1);
  vertex(1, 1, 0, 0, 1);

  // Left
  vertex(0, 0, 0, 0, 0);
  vertex(0, 0, 1, 1, 0);
  vertex(0, 1, 1, 1, 1);
  vertex(0, 1, 0, 0, 1);

  // Right
  vertex(1, 0, 0, 0, 0);
  vertex(1, 0, 1, 1, 0);
  vertex(1, 1, 1, 1, 1);
  vertex(1, 1, 0, 0, 1);

  endShape();

  popMatrix();
}

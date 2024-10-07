Gif spaceshuttle;

void setup() {
  size(1500, 850);
  spaceshuttle = new Gif("spaceshuttle/frame_", "_delay-0.1s.gif", 43, 2, 0, 0, width, height);
  //Gif(String before, String after, int numFrame, int speed, int x, int y) - Gif Signature/Constructor
}

void draw() {
  spaceshuttle.show();
}

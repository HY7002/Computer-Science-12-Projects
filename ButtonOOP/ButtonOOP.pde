// Color Pallete
color white = #FFFFFF;
color black = #000000;
color blue = #87CEEB;
color red = #FF7F7F;
color pink = #F76DDC;
color green = #CEF255;
color yellow = #FFF387;

boolean mouseReleased;
boolean wasPressed;

color bkg;
Button[] myButtons;

void setup() {
  size(1000, 1000);
  bkg = white;

  myButtons = new Button[4];
  myButtons[0] = new Button("BLUE", 200, 200, 200, 150, blue, pink);
  myButtons[1] = new Button("GREEN", 200, 400, 200, 150, green, red);
  myButtons[2] = new Button("PINK", 400, 650, 600, 200, pink, blue);
  myButtons[3] = new Button("BLACK", 550, 300, 400, 350, black, white);
}

void draw() {
  click();
  background(bkg);

  int i = 0;
  while (i < 4) {
    myButtons[i].show();
    if (myButtons[i].clicked) {
      bkg = myButtons[i].normal;
    }
    i++;
  }
}

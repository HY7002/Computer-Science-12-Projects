import fisica.*;
FWorld world;

// COLOR PALLETE
color white = #FFFFFF;
color black = #000000;
color green = #00FF00;
color red = #FF0000;
color blue = #0000FF;
color orange = #F0A000;
color brown = #996633;

   
//MAP COLOR\\

// FLOOR COLOR
color stoneFloor = #969696;
color grassFloor = #34a834;
color dirtFloor = #9e6a42;
color iceFloor = #00ffff;
color spikeFloor = #ff1493;
color bridge = #800080;

//TREE
color treeTrunk = #ff7300;
color treeLeaves = #00ff6e;


PImage map, ice, stone, grass, dirt, spike;
int gridSize = 32;
float scale = 1.5;
boolean wkey, akey, dkey;
FPlayer player;

void setup() {
  size(600, 600);
  Fisica.init(this);
  
  // Asset Loader
  map = loadImage("mapTEST.png");
  stone = loadImage("brick.png");
  grass = loadImage("dirt_n.png");
  dirt = loadImage("dirt_center.png");
  ice = loadImage("blueBlock.png");
  spike = loadImage("spike.png");
  
  loadWorld(map);
  loadPlayer();
}

void loadWorld(PImage img) {
  world = new FWorld(-2000, -2000, 2000, 2000);
  world.setGravity(0, 900);

  for (int y = 0; y < map.height; y++) {
    for (int x = 0; x < map.width; x++) {
      color c = img.get(x, y);
      FBox b = new FBox(gridSize, gridSize);
      b.setPosition(x*gridSize, y*gridSize);
      b.setStatic(true);
      b.setGrabbable(false);
      
     // STONE FLOOR
      if (c == stoneFloor || c == black) {
        b.attachImage(stone);
        b.setName("stone");
        b.setFriction(4);
        world.add(b);
      } 
      
     // GRASS FLOOR 
      if (c == grassFloor) {
        b.attachImage(grass);
        b.setName("grass");
        b.setFriction(2);
        world.add(b);
      }
      
    // DIRT FLOOR
      if (c == dirtFloor) {
        b.attachImage(dirt);
        b.setName("dirt");
        b.setFriction(2);
        world.add(b);    
    }
    
    // ICE FLOOR
      if (c == iceFloor) {
        b.attachImage(ice);
        b.setName("ice");
        b.setFriction(0);
        world.add(b);  
      }
   
   // SPIKE FLOOR
     if (c == spikeFloor) {
        b.attachImage(spike);
        b.setName("spike");
        b.setFriction(4);
        world.add(b);      
     }
    }
  }
}

void loadPlayer() {
 player = new FPlayer(); 
 world.add(player);
}

void draw() {
  background(135, 206, 235);
  drawWorld();
  player.act();
}

void drawWorld() {
  pushMatrix();
  translate(-player.getX()*scale+width/2, -player.getY()*scale+height/2);
  scale(scale);
  world.step();
  world.draw();
  popMatrix();
}

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


// MODE FUNCTIONS \\
int mode;

//MAP COLOR\\
// FLOOR COLOR
color stoneFloor = #969696;
color invisBarrier = #6f3198;
color grassFloor = #34a834;
color dirtFloor = #9e6a42;

PImage spawn, lobby, stone, grass, dirt, invisiBarrier;

int gridSize = 32;
float scale = 1.5;
boolean wkey, akey, dkey, spaceBar;

FPlayer player;
ArrayList<FGameObject> terrain;
ArrayList<FGameObject> enemies;

void setup() {
  size(600, 600);
  Fisica.init(this);

  // Asset Loader
  spawn = loadImage("spawn.png");
  lobby = loadImage("lobby.png");
  stone = loadImage("brick.png");
  grass = loadImage("dirt_n.png");
  dirt = loadImage("dirt_center.png");
  invisiBarrier = loadImage("invisible_barrier.png");

  terrain = new ArrayList<FGameObject>();
  enemies = new ArrayList<FGameObject>();

  // MAP LOADER
  loadWorld(spawn);

  loadPlayer();
}

void loadWorld(PImage img) {
  world = new FWorld(-50000, -50000, 50000, 50000);
  world.setGravity(0, 900);

  for (int y = 0; y < spawn.height; y++) {
    for (int x = 0; x < spawn.width; x++) {
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

      if (c == grassFloor) {
        b.attachImage(grass);
        b.setName("grass");
        b.setFriction(4);
        world.add(b);
      }

      if (c == invisBarrier) {
        b.attachImage(invisiBarrier);
        b.setName("invisBarrier");
        b.setFriction(4);
        world.add(b);
      }

      if (c == dirtFloor) {
        b.attachImage(dirt);
        b.setName("dirt");
        b.setFriction(4);
        world.add(b);
      }
    }
  }

  for (int y = 0; y < lobby.height; y++) {
    for (int x = 0; x < lobby.width; x++) {
      color c = img.get(x, y);
      FBox b = new FBox(gridSize, gridSize);
      b.setPosition(x*gridSize, y*gridSize);
      b.setStatic(true);
      b.setGrabbable(false);
      
      if (c == grassFloor) {
        b.attachImage(grass);
        b.setName("grass");
        b.setFriction(4);
        world.add(b);
      }

      if (c == stoneFloor) {
        b.attachImage(stone);
        b.setName("stone");
        b.setFriction(4);
        world.add(b);
      }

      if (c == dirtFloor) {
        b.attachImage(dirt);
        b.setName("dirt");
        b.setFriction(4);
        world.add(b); 
      }
    }
  }
}

void loadPlayer() {
  player = new FPlayer();
  player.setPosition(31, 630);
  world.add(player);
}

void draw() {
  background(255);
  drawWorld();
  actWorld();
}

void actWorld() {
  player.act();
  for (int i = 0; i < terrain.size(); i++) {
    FGameObject t = terrain.get(i);
    t.act();
  }
  for (int i = 0; i < enemies.size(); i++) {
    FGameObject e = enemies.get(i);
    e.act();
  }
}

void drawWorld() {
  pushMatrix();
  translate(-player.getX()*scale+width/2, -player.getY()*scale+height/2);
  scale(scale);
  world.step();
  world.draw();
  popMatrix();
}

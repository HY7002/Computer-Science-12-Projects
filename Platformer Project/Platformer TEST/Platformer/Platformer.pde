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
color invisBarrier = #6f3198;
color grassFloor = #34a834;
color dirtFloor = #9e6a42;
color bridgeFloor = #800080;
color spikeFloor = #ff1493;
color wallRed = #ff0000;
color goombaYellow = #ffa200;

// Teleporter Color
color teleporterStage1Floor = #ff00ff;
color S1LobTPFloor = #00bfff;

// Floor PImages
PImage stone, grass, dirt, spike, bridge, invisiBarrier;

// Map Images
PImage spawn, lobby, stage1;

// Teleporter PImages
PImage teleportToStage1;
PImage S1returnToLobby;

// Goomba Animation
PImage[] goomba;

int gridSize = 32;
float scale = 1.5;

// Key Booleans
boolean wkey, akey, dkey, spaceBar;

FPlayer player;
ArrayList<FGameObject> terrain;
ArrayList<FGameObject> enemies;

void setup() {
  size(600, 600);
  Fisica.init(this);

  // Asset Loader \\
  // Map Textures
  spawn = loadImage("spawn.png");
  lobby = loadImage("lobby.png");
  stage1 = loadImage("stage1.png");

  // Terrain Textures
  stone = loadImage("brick.png");
  grass = loadImage("dirt_n.png");
  dirt = loadImage("dirt_center.png");
  spike = loadImage("spike.png");
  bridge = loadImage("bridge_center.png");
  invisiBarrier = loadImage("invisible_barrier.png");

  // Teleporter Asset Loader
  teleportToStage1 = loadImage("teleporter.png");
  S1returnToLobby = loadImage("teleporter.png");
  
  // GOOMBA IMAGE LOADER
  goomba = new PImage[2];
  goomba[0] = loadImage("goomba0.png");
  goomba[0].resize(gridSize, gridSize);
  goomba[1] = loadImage("goomba1.png");
  goomba[1].resize(gridSize, gridSize);
  
  PImage pic = loadImage("goomba0.png");
  reverseImage(pic).save("goomba1.png");

  terrain = new ArrayList<FGameObject>();
  enemies = new ArrayList<FGameObject>();

  // MAP LOADER
  loadWorld(stage1);

  loadPlayer();
}

void loadWorld(PImage img) {
  world = new FWorld(-20000, -20000, 20000, 20000);
  world.setGravity(0, 900);

  // SPAWN ===================================================
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
      
     if (c == wallRed) {
       b.attachImage(grass);
       b.setName("wall");
       world.add(b);
     }
    }
  }

  // LOBBY ===================================================
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

      if (c == teleporterStage1Floor) {
        b.attachImage(teleportToStage1);
        b.setName("teleportToStage1");
        b.setFriction(4);
        world.add(b);
      }
    }
  }

  // GAME MAP 1 ===================================================
  for (int y = 0; y < stage1.height; y++) {
    for (int x = 0; x < stage1.width; x++) {
      color c = img.get(x, y);
      FBox b = new FBox(gridSize, gridSize);
      b.setPosition(x*gridSize, y*gridSize);
      b.setStatic(true);
      b.setGrabbable(false);

      if (c == spikeFloor) {
        b.attachImage(spike);
        b.setName("spike");
        b.setFriction(4);
        world.add(b);
      }

      if (c == bridgeFloor) {
        FBridge br = new FBridge(x*gridSize, y*gridSize);
        terrain.add(br);
        world.add(br);
      }
      
      if (c == S1LobTPFloor) {
        b.attachImage(S1returnToLobby);
        b.setName("S1returnToLobby");
        b.setFriction(4);
        world.add(b);
      }
      
      // GOOMBAS
      if (c == goombaYellow) {
        FGoomba gmb = new FGoomba(x*gridSize, y*gridSize);
        enemies.add(gmb);
        world.add(gmb);
      }
      
      // Wall
      if (c == wallRed) {
        b.attachImage(grass);
        b.setName("wall");
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
  background(135, 206, 235);
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

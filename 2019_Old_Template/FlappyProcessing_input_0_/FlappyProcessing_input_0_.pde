Player player;

Wall wall;

void setup() {
  size(640, 480, FX2D);

  player = new Player();

  wall = new Wall();
  wall.resetPosition();
}


void draw() {
  // clear background
  background(#0074D9);

  // add gravity
  player.accelerate(0, 0.2);

  // update
  player.update();
  wall.update();

  // display
  player.display();
  wall.display();
}

void keyPressed() {
  // game inputs
  if (key == ' ') {
    player.accelerate(0, -4);
  }
}

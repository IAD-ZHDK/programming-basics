Player player;

Wall wall;

PowerUp powerUp;

void setup() {
  size(640, 480, FX2D);

  player = new Player();

  wall = new Wall();
  powerUp = new PowerUp();
  wall.resetPosition();
  powerUp.resetPosition();
}


void draw() {
  // clear background
  background(#0074D9);

  // add gravity
  player.accelerate(0, 0.2);

  // update
  player.update();
  wall.update();
  powerUp.update();

  // checkColision
  player.checkRectCollision(wall);
  player.checkCircleCollision(powerUp);
  
  // display

  wall.display();
  player.display();
  powerUp.display();
}

void keyPressed() {
  // game inputs
  if (key == ' ') {
    player.accelerate(0, -4);
  }
}

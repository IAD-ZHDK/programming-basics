Player player; //<>//
Wall wall1;
Wall wall2;

PowerUp powerUp;

color bgColor = #0074D9;

String activeState = "Menu";

void setup() {
  size(640, 480, FX2D);

  player = new Player();

  wall1 = new Wall();
  wall1.resetPosition();

  wall2 = new Wall();
  wall2.resetPosition();
  wall2.pos.x += 200;

  powerUp = new PowerUp();
}

void draw() {
  if (activeState.equals("Menu")) {
    runMenuState();
  }
  if (activeState.equals("Game")) {
    runGameState();
  }
  if (activeState.equals("Quit")) {
    runQuitState();
  }
}

void runMenuState() {
  background(0);
  fill(255);
  textAlign(CENTER, CENTER);
  textSize(20);
  text("G for game, Q for quit.", width / 2, height / 2);
}

void resetGame() {
  player.reset();
  wall1.resetPosition();
  wall2.resetPosition();
  powerUp.resetPosition();
}

void runGameState() {
  // check collisions
  player.checkCollisionWithWall(wall1);
  player.checkCollisionWithWall(wall2);
  player.checkCollisionWithPowerUp(powerUp);

  // clear background
  background(bgColor);

  // add gravity
  player.accelerate(0, 0.2);

  // update
  player.update();
  wall1.update();
  wall2.update();
  powerUp.update();

  // display 
  player.display();
  wall1.display();
  wall2.display();
  powerUp.display();

  bgColor = #0074D9;
}

void runQuitState() {
  exit();
}

void keyPressed() {
  // game inputs
  if (activeState.equals("Game")) {
    if (key == ' ') {
      player.accelerate(0, -4);
    }

    if (key == 'm' || key == 'M') {
      activeState = "Menu";
    }
  }

  if (activeState.equals("Menu")) {
    if (key == 'g' || key == 'G') {
      resetGame();
      activeState = "Game";
    }

    if (key == 'q' || key == 'Q') {
      activeState = "Quit";
    }
  }
}

boolean checkRectangle(
  float r1x, float r1y, float r1w, float r1h, 
  float r2x, float r2y, float r2w, float r2h) {

  return (r1x < r2x + r2w &&
    r1x + r1w > r2x &&
    r1y < r2y + r2h &&
    r1y + r1h > r2y);
}

boolean checkCircle(
  float cxa, float cya, float ra, 
  float cxb, float cyb, float rb) {

  return dist(cxa, cya, cxb, cyb) < ra + rb;
}

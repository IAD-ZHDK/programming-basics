Player player;

Wall wall;

PowerUp powerUp;

String activeState = "Menu";

void setup() {
  size(640, 480, FX2D);

  player = new Player();

  wall = new Wall();
  powerUp = new PowerUp();
  wall.resetPosition();
  powerUp.resetPosition();
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

void resetGame() {
  player.reset();
  wall.resetPosition();
  powerUp.resetPosition();
}

void runMenuState() {
  background(0);

  fill(255);
  textAlign(CENTER, CENTER);
  textSize(20);
  text("G for game, Q for quit.", width / 2, height / 2);
}

void runGameState() {
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

void runQuitState() {
  exit();
}

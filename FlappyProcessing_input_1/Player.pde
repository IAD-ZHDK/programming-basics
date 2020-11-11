class Player {
  // visual attributes
  float size = 40;

  // physical attributes
  final float speedLimit = 5;

  float velocityX = 0;
  float velocityY = 0;

  float x = width / 5;
  float y = height / 2;

  void update() {
    x += velocityX;
    y += velocityY;
  }

  void display() {
    noStroke();
    fill(#DDDDDD);
    circle(x, y, size);
  }

  void accelerate(float accelerationX, float accelerationY) {
    // add acceleration
    velocityX += accelerationX;
    velocityY += accelerationY;

    // limit velocity to max speed
    velocityX = constrain(velocityX, -speedLimit, speedLimit);
    velocityY = constrain(velocityY, -speedLimit, speedLimit);
  }

  void checkCollisionWithWall(Wall wall) {
    float x1 = x - (size * 0.5);
    float y1 = y - (size * 0.5);

    if (checkRectangle(x1, y1, size, size, 
      wall.x, wall.y, wall.size, height - wall.y)) {
      println("wall has been hit");
      bgColor = color(255, 0, 0);
    }
  }

  void checkCollisionWithPowerUp(PowerUp powerUp) {
    if (checkCircle(x, y, size / 2, 
      powerUp.x, powerUp.y, powerUp.size / 2)) {
      println("pwoer-up has been hit");
      bgColor = color(0, 255, 255);
    }
  }
}

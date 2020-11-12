class Player {
  // visual attributes
  float size = 40;

  // physical attributes
  final float speedLimit = 5;
  PVector velocity = new PVector(0, 0);
  PVector pos = new PVector(width / 5, height / 2);

  void reset() {
    velocity = new PVector(0, 0);
    pos = new PVector(width / 5, height / 2);
  }

  void update() {
    pos.add(velocity);

    if (pos.y >= height) {
      activeState = "Menu";
    }
  }

  void display() {
    noStroke();
    fill(#DDDDDD);
    circle(pos.x, pos.y, size);
  }

  void accelerate(float accelerationX, float accelerationY) {
    PVector acceleration = new PVector(accelerationX, accelerationY);
    // add acceleration
    velocity.add(acceleration);
    // limit velocity to max speed
    velocity.limit(speedLimit);
  }

  void checkCollisionWithWall(Wall wall) {
    float x1 = pos.x - (size * 0.5);
    float y1 = pos.y - (size * 0.5);

    if (checkRectangle(x1, y1, size, size, 
      wall.pos.x, wall.pos.y, wall.size, height - wall.pos.y)) {
      println("wand wurde getroffen");
      if (!file[1].isPlaying()) {
        file[1].play();
      }
      bgColor = color(255, 0, 0);
    }
  }

  void checkCollisionWithPowerUp(PowerUp powerUp) {
    if (checkCircle(pos.x, pos.y, size / 2, 
      powerUp.pos.x, powerUp.pos.y, powerUp.size / 2)) {
      println("powerup wurde getroffen");
      if (!file[0].isPlaying()) {
        file[0].play();
      }
      bgColor = color(0, 255, 255);
    }
  }
}

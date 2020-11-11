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
}

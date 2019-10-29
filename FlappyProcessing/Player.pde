class Player {
  // visual attributes
  float size = 40;

  // physical attributes
  private float speedLimit = 5;

  PVector velocity = new PVector();
  PVector position = new PVector(width / 5, height / 2);

  void update() {
    position.add(velocity);
  }

  void display() {
    noStroke();
    fill(#DDDDDD);
    circle(position.x, position.y, size);
  }

  void accelerate(float accelerationX, float accelerationY) {
    // add acceleration
    velocity.add(accelerationX, accelerationY);

    // limit velocity
    velocity.limit(speedLimit);
  }
}

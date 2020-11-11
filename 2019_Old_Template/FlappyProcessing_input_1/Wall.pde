class Wall {
  // visual attributes
  float H = 0;
  float W = 200;

  PVector position = new PVector();
  PVector velocity = new PVector(-3, 0);

  void update() {
    position.add(velocity);
    // add wall again if it is out of screen
    if ((position.x + W) < 0)
    {
      resetPosition();
    }
  }

  void resetPosition() {
    position = new PVector(width, height - random(height / 5, height / 2));
    H = height - position.y;
  }

  void display() {
    noStroke();
    fill(#001f3f);
    rect(position.x, position.y, W, H);
  }


}

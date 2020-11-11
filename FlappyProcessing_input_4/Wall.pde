class Wall {
  // visual attributes
  float size = 100;

  PVector velocity = new PVector(-3, 0);
  PVector pos = new PVector(0, 0);
 
  void update() {
    pos.add(velocity);

    // add wall again if it is out of screen
    if ((pos.x + size) < 0)
    {
      resetPosition();
    }
  }

  void resetPosition() {
    pos.set(width, height - random(height / 5, height / 2));
  }

  void display() {
    noStroke();
    fill(#001f3f);
    rect(pos.x, pos.y, size, height - pos.y);
  }
}

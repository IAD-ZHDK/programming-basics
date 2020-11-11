class Wall {
  // visual attributes
  float size = 100;

  PVector position = new PVector();
  PVector velocity = new PVector(-3, 0);

  void update() {
    position.add(velocity);

    // add wall again if it is out of screen
    if ((position.x + size) < 0)
    {
      resetPosition();
    }
  }

  void resetPosition() {
    position = new PVector(width, height - random(height / 5, height / 2));
  }

  void display() {
    noStroke();
    fill(#001f3f);
    rect(position.x, position.y, size, height - position.y);
  }
  
  
}

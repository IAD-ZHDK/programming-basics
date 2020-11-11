class PowerUp {
 
  float diameter = 50;
  PVector position = new PVector();
  PVector velocity = new PVector(-4, 0);

  void update() {
    position.add(velocity);
    
    if ((position.x + diameter) < 0)
    {
      resetPosition();
    }
  }

  void resetPosition() {
    position = new PVector(width, random(height));
  }

  void display() {
    noStroke();
    fill(#00FF00);
    circle(position.x, position.y, diameter);
  }
}

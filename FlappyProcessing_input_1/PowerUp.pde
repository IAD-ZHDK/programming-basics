class PowerUp {
  // visual attributes
  float size = 100;
  
  float velocityX = -3;
  float velocityY = 0;

  float x = 0;
  float y = 0;


  void update() {
    x += velocityX;
    y += velocityY;
    
    // add wall again if it is out of screen
    if ((x + size) < 0)
    {
      resetPosition();
    }
  }

  void resetPosition() {
    x = width;
    y = random(0, height);
  }

  void display() {
    noStroke();
    fill(255);
    circle(x, y, size);
  }
}

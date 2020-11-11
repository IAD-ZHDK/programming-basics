class Wall {
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
    y = height - random(height / 5, height / 2);
  }

  void display() {
    noStroke();
    fill(#001f3f);
    rect(x, y, size, height - y);
  }
}

class Player {
  // visual attributes
  float diameter = 40;
  int Color = #DDDDDD;
  // physical attributes
  private float speedLimit = 5;

  PVector velocity = new PVector();
  PVector position = new PVector(width / 5, height / 2);

  void update() {
    position.add(velocity);
  }

  void display() {
    noStroke();
    fill(Color);
    circle(position.x, position.y, diameter);
  }

  void accelerate(float accelerationX, float accelerationY) {
    // add acceleration
    velocity.add(accelerationX, accelerationY);

    // limit velocity
    velocity.limit(speedLimit);
  }


  boolean checkCircleCollision(PowerUp object2) {
    float X1 = position.x; 
    float Y1 = position.y;
    float R1 = diameter/2;

    float X2 = object2.position.x;
    float Y2 = object2.position.y;
    float R2 = object2.diameter/2;

    if (dist(X1, Y1, X2, Y2) <= R1+R2) {
      Color = #00FF00;
      println("Hit PowerUp");
      return true;
    }
    return false;
  };


  boolean checkRectCollision(Wall object2) {
    // collision detection for rectangle rectangle
    float R1 = position.x+(diameter/2); // player right edge
    float L1 = position.x-(diameter/2); // player left edge
    float T1 = position.y-(diameter/2); // player top edge
    float B1 = position.y+(diameter/2); // player bottom edge

    float R2 = object2.position.x+(object2.W); // object 2 right edge
    float L2 = object2.position.x; // object 2 left edge
    float T2 = object2.position.y; // object 2 top edge
    float B2 = object2.position.y+(object2.H); // object 2 bottom edge

    if (R1 >= L2 && L1<=R2 && B1>= T2 && T1 <= B2) {
      println("hit");
      Color = #DD0000;
      return true;
    }
    Color = #DDDDDD;
    return false;
  }
}

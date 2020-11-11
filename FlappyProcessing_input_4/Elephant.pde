class Elephant {
  PImage[] imageList = new PImage[24];
  PVector velocity = new PVector(-2, 0);
  PVector pos = new PVector(0, 0);
  
  Elephant() {
    for (int i = 0; i < imageList.length; i++) {
      int index = i;
      imageList[i] = loadImage("images/elephantsoutline_"+index+".gif");
    }
    resetPosition();
  }

  void update() {
    pos.add(velocity);
    // add wall again if it is out of screen
    if ((pos.x + imageList[0].width) < 0)
    {
      resetPosition();
    }
  }

  void resetPosition() {
    pos.set(width+400, height - imageList[0].height);
  }

  void display() {
    noStroke();
    fill(#001f3f);
    int index = frameCount/4 % (imageList.length-1);
    image(imageList[index], pos.x, pos.y, imageList[index].width, imageList[index].height);
  }
}

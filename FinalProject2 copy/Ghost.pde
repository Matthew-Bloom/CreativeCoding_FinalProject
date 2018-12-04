
class Ghost
{

  PImage img;
  int gX, gY;
  
  int time = 10;
  int tick = millis();
  
  void establish()
  {
    imageMode(CORNER);
    img = loadImage("ghost.gif");
    tint(255, int(random(5, 255)));
    image(img, int(random(520, 530)) + gX, int(random(480, 500)) + gY, 100, 116);
    image(img, int(random(310, 320)) + gX, int(random(520, 580)) + gY, 100, 116);
    

    if (millis() > tick + 30)
    {
      move();
      tick = millis();
    }
  }
  
  void move()
  {
      gX = gX - int(random(-3, 3));
      gY = gY - int(random(-3, 3));
  }

  
}

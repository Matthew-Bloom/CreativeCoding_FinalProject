
class Ghost
{

  PImage img;
  int gX, gY;
  int gX2, gY2;
  
  int time = 10;
  int tick = millis();
  
  void establish()
  {
    imageMode(CORNER);
    img = loadImage("ghost.gif");
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
  
  
  void establishMoving()
  {
    imageMode(CORNER);
    img = loadImage("ghost.gif");
    image(img, gX2, gY2, 100, 116);
    

    if (millis() > tick + 66)
    {
      moveHostile();
      tick = millis();
    }
  }
  
  void moveHostile()
  {
      if(gX2 > xPos)
      {
        gX2 -= 2;
      }
      if(gX2 < xPos)
      {
        gX2 += 2;
      }
      if(gY2 < yPos)
      {
        gY2 += 2;
      }
      if(gY2 > yPos)
      {
        gY2 -= 2;
      }
      
  }
  
}

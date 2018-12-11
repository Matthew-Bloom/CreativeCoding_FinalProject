class Desk
{
  PImage img;
  float r;
  int rand = int(r);
  
  void interact()
  {
    if(xPos > 620 && xPos < 840  && yPos <= -20)
    {
      if(rand == 11 || rand == 13|| rand == 15|| rand == 19)
      {
        if (keyPressed)  
        {
          if (key == ' ')
          {
            imageMode(CORNER);
            img = loadImage("desk v2 zoom.png");
            image(img, 0, 0, width, height);
          }
        }
      }
      else if(rand == 5 || rand == 10|| rand == 14|| rand == 18)
      {
        if (keyPressed)  
        {
          if (key == ' ')
          {
            imageMode(CORNER);
            img = loadImage("desk v3 zoom.png");
            image(img, 0, 0, width, height);
          }
        }
      }
      else
      {
        if (keyPressed)  
        {
          if (key == ' ')
          {
            imageMode(CORNER);
            img = loadImage("desk zoom.png");
            image(img, 0, 0, width, height);
          }
        }
      }
    }
  }

}

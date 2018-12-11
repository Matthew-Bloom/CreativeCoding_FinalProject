class Painting
{
  PImage img;
  float r;
  int rand = int(r);
  

  void interact()
  {
    if(xPos > 250 && xPos < 350 && yPos < -40)
    {
      if(rand == 7 || rand == 17 || rand == 18)
      {
        if (keyPressed)  
        {
          if (key == ' ')
          {
            imageMode(CORNER);
            img = loadImage("painting v1 zoom.png");
            image(img, 0, 0, width, height);
          }
        }
      }
      else if(rand == 3 || rand == 6 || rand == 9)
      {
        if (keyPressed)  
        {
          if (key == ' ')
          {
            imageMode(CORNER);
            img = loadImage("painting v2 zoom.png");
            image(img, 0, 0, width, height);
          }
        }
      }
      else if(rand == 4 || rand == 8 || rand == 12 || rand == 16)
      {
        if (keyPressed)  
        {
          if (key == ' ')
          {
            imageMode(CORNER);
            img = loadImage("painting v3 zoom.png");
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
            img = loadImage("painting zoom.png");
            image(img, 0, 0, width, height);
          }
        }
      }
    }
  }
  


}

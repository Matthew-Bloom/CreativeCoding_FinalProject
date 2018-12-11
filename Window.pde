class Window
{
  PImage img;
  float r;
  int rand = int(r);
  
  void interact()
  {
    if(xPos > 80 && xPos < 200 && yPos < -40)
    {
      if(rand == 5 || rand == 15)
      {
        if (keyPressed)  
        {
          if (key == ' ')
          {
            imageMode(CORNER);
            img = loadImage("window v1 zoom.png");
            image(img, 0, 0, width, height);
          }
        }
      }
      else if(rand == 10 || rand == 20)
      {
        if (keyPressed)  
        {
          if (key == ' ')
          {
            imageMode(CORNER);
            img = loadImage("window v2 zoom.png");
            image(img, 0, 0, width, height);
          }
        }
      }
      else if(rand == 13)
      {
        if (keyPressed)  
        {
          if (key == ' ')
          {
            imageMode(CORNER);
            img = loadImage("window v3 zoom.png");
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
            img = loadImage("window zoom.png");
            image(img, 0, 0, width, height);
          }
        }
      }
    }
  }
  


}

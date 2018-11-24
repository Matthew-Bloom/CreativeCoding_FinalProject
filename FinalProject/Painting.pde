class Painting
{
  PImage img;
  boolean isDrawn;
  float r;
  int rand = int(r);
  
  void establish()
  {
    if(rand == 7 || rand == 17 || rand == 18)
    {
      imageMode(CENTER);
      img = loadImage("painting v1.png");
      image(img, 299, 494, 31, 28); 
    }
    else if(rand == 3 || rand == 6 || rand == 9)
    {
      imageMode(CENTER);
      img = loadImage("painting v2.png");
      image(img, 299, 494, 31, 28); 
    }
    else if(rand == 4 || rand == 8 || rand == 12 || rand == 16)
    {
      imageMode(CENTER);
      img = loadImage("painting v3.png");
      image(img, 299, 494, 31, 28); 
    }
    else
    {
      imageMode(CENTER);
      img = loadImage("painting.png");
      image(img, 299, 494, 31, 28); 
    }
  }
  
  void interact()
  {
    if(xPos < 250 || xPos > 350)
    {
      if(rand == 7 || rand == 17 || rand == 18)
      {
        imageMode(CENTER);
        img = loadImage("painting v1.png");
        image(img, 299, 494, 31, 28); 
      }
      else if(rand == 3 || rand == 6 || rand == 9)
      {
        imageMode(CENTER);
        img = loadImage("painting v2.png");
        image(img, 299, 494, 31, 28); 
      }
      else if(rand == 4 || rand == 8 || rand == 12 || rand == 16)
      {
        imageMode(CENTER);
        img = loadImage("painting v3.png");
        image(img, 299, 494, 31, 28); 
      }
      else
      {
        imageMode(CENTER);
        img = loadImage("painting.png");
        image(img, 299, 494, 31, 28); 
      }
    }
    else if(xPos > 250 && xPos < 350 && yPos < -40)
    {
      if(rand == 7 || rand == 17 || rand == 18)
      {
        imageMode(CENTER);
        img = loadImage("painting v1 glow.png");
        image(img, 299, 494, 76, 98);
        if (keyPressed)  
        {
          if (key == ' ' && isDrawn == false)
          {
            background(0);
            imageMode(CORNER);
            img = loadImage("painting v1 zoom.png");
            image(img, 0, 0, width, height);
            isDrawn = true;
          }
          if (key == ' ' && isDrawn == true)
          {
             isDrawn = false;
          }
        }
      }
      else if(rand == 3 || rand == 6 || rand == 9)
      {
        imageMode(CENTER);
        img = loadImage("painting v2 glow.png");
        image(img, 299, 494, 76, 98);
        if (keyPressed)  
        {
          if (key == ' ' && isDrawn == false)
          {
            background(0);
            imageMode(CORNER);
            img = loadImage("painting v2 zoom.png");
            image(img, 0, 0, width, height);
            isDrawn = true;
          }
          if (key == ' ' && isDrawn == true)
          {
             isDrawn = false;
          }
        }
      }
      else if(rand == 4 || rand == 8 || rand == 12 || rand == 16)
      {
        imageMode(CENTER);
        img = loadImage("painting v3 glow.png");
        image(img, 299, 494, 76, 98);
        if (keyPressed)  
        {
          if (key == ' ' && isDrawn == false)
          {
            background(0);
            imageMode(CORNER);
            img = loadImage("painting v3 zoom.png");
            image(img, 0, 0, width, height);
            isDrawn = true;
          }
          if (key == ' ' && isDrawn == true)
          {
             isDrawn = false;
          }
        }
      }
      else
      {
        imageMode(CENTER);
        img = loadImage("painting glow.png");
        image(img, 299, 494, 76, 98);
        if (keyPressed)  
        {
          if (key == ' ' && isDrawn == false)
          {
            background(0);
            imageMode(CORNER);
            img = loadImage("painting zoom.png");
            image(img, 0, 0, width, height);
            isDrawn = true;
          }
          if (key == ' ' && isDrawn == true)
          {
             isDrawn = false;
          }
        }
      }
    }
  }
  


}

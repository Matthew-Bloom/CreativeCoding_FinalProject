class Window
{
  PImage img;
  boolean isDrawn;
  float r;
  int rand = int(r);
  
  void establish()
  {
    if(rand == 5 || rand == 15)
    {
      imageMode(CENTER);
      img = loadImage("window v1.png");
      image(img, 144, 474, 54, 54); 
    }
    else if(rand == 10 || rand == 20)
    {
      imageMode(CENTER);
      img = loadImage("window v2.png");
      image(img, 144, 474, 54, 54); 
    }
    else if(rand == 13)
    {
      imageMode(CENTER);
      img = loadImage("window v3.png");
      image(img, 144, 474, 54, 54); 
    }
    else
    {
      imageMode(CENTER);
      img = loadImage("window.png");
      image(img, 144, 474, 54, 54); 
    }
  }
  
  void interact()
  {
    if(xPos < 80 || xPos > 200)
    {
      if(rand == 5 || rand == 15)
      {
        imageMode(CENTER);
        img = loadImage("window v1.png");
        image(img, 144, 474, 54, 54); 
      }
      else if(rand == 10 || rand == 20)
      {
        imageMode(CENTER);
        img = loadImage("window v2.png");
        image(img, 144, 474, 54, 54); 
      }
      else if(rand == 13)
      {
        imageMode(CENTER);
        img = loadImage("window v3.png");
        image(img, 144, 474, 54, 54); 
      }
      else
      {
        imageMode(CENTER);
        img = loadImage("window.png");
        image(img, 144, 474, 54, 54); 
      }
    }
    else if(xPos > 80 && xPos < 200 && yPos < -40)
    {
      if(rand == 5 || rand == 15)
      {
        imageMode(CENTER);
        img = loadImage("window v1 glow.png");
        image(img, 144, 474, 158, 156);
        if (keyPressed)  
        {
          if (key == ' ' && isDrawn == false)
          {
            background(0);
            imageMode(CORNER);
            img = loadImage("window v1 zoom.png");
            image(img, 0, 0, width, height);
            isDrawn = true;
          }
          if (key == ' ' && isDrawn == true)
          {
             isDrawn = false;
          }
        }
      }
      else if(rand == 10 || rand == 20)
      {
        imageMode(CENTER);
        img = loadImage("window v2 glow.png");
        image(img, 144, 474, 158, 156);
        if (keyPressed)  
        {
          if (key == ' ' && isDrawn == false)
          {
            background(0);
            imageMode(CORNER);
            img = loadImage("window v2 zoom.png");
            image(img, 0, 0, width, height);
            isDrawn = true;
          }
          if (key == ' ' && isDrawn == true)
          {
             isDrawn = false;
          }
        }
      }
      else if(rand == 13)
      {
        imageMode(CENTER);
        img = loadImage("window v3 glow.png");
        image(img, 144, 474, 158, 156);
        if (keyPressed)  
        {
          if (key == ' ' && isDrawn == false)
          {
            background(0);
            imageMode(CORNER);
            img = loadImage("window v3 zoom.png");
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
        img = loadImage("window glow.png");
        image(img, 144, 474, 158, 156);
        if (keyPressed)  
        {
          if (key == ' ' && isDrawn == false)
          {
            background(0);
            imageMode(CORNER);
            img = loadImage("window zoom.png");
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

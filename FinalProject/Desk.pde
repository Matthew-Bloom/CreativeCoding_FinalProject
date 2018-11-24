class Desk
{
  PImage img;
  boolean isDrawn;
  float r;
  int rand = int(r);
  
  void establish()
  {
    if(rand == 8 || rand == 9)
    {
      imageMode(CENTER);
      img = loadImage("desk v1.png");
      image(img, 730, 567, 263, 160); 
    }
    else if(rand == 11 || rand == 13|| rand == 15|| rand == 19)
    {
      imageMode(CENTER);
      img = loadImage("desk v2.png");
      image(img, 730, 567, 263, 160); 
    }
    else if(rand == 5 || rand == 10|| rand == 14|| rand == 18)
    {
      imageMode(CENTER);
      img = loadImage("desk v3.png");
      image(img, 730, 567, 263, 160); 
    }
    else
    {
      imageMode(CENTER);
      img = loadImage("desk.png");
      image(img, 730, 567, 263, 160); 
    }
  }
  
  void interact()
  {
    if(xPos < 620 || xPos > 840)
    {
      if(rand == 8 || rand == 9)
      {
        imageMode(CENTER);
        img = loadImage("desk v1.png");
        image(img, 730, 567, 263, 160); 
      }
      else if(rand == 11 || rand == 13|| rand == 15|| rand == 19)
      {
        imageMode(CENTER);
        img = loadImage("desk v2.png");
        image(img, 730, 567, 263, 160); 
      }
      else if(rand == 5 || rand == 10|| rand == 14|| rand == 18)
      {
        imageMode(CENTER);
        img = loadImage("desk v3.png");
        image(img, 730, 567, 263, 160); 
      }
      else
      {
        imageMode(CENTER);
        img = loadImage("desk.png");
        image(img, 730, 567, 263, 160); 
      }
    }
    else if(xPos > 620 && xPos < 840  && yPos <= -20)
    {
      if(rand == 8 || rand == 9)
      {
        imageMode(CENTER);
        img = loadImage("desk v1 glow.png");
        image(img, 730, 567, 263, 160);
        if (keyPressed)  
        {
          //COMPUTER FUNCTION.
          
          
          
          /**
          if (key == ' ' && isDrawn == false)
          {
            background(0);
            imageMode(CORNER);
            img = loadImage("desk v1 zoom.png");
            image(img, 0, 0, width, height);
            isDrawn = true;
          }
          if (key == ' ' && isDrawn == true)
          {
             isDrawn = false;
          }
          **/
        }
      }
      else if(rand == 11 || rand == 13|| rand == 15|| rand == 19)
      {
        imageMode(CENTER);
        img = loadImage("desk v2 glow.png");
        image(img, 730, 567, 263, 160);
        if (keyPressed)  
        {
          if (key == ' ' && isDrawn == false)
          {
            background(0);
            imageMode(CORNER);
            img = loadImage("desk v2 zoom.png");
            image(img, 0, 0, width, height);
            isDrawn = true;
          }
          if (key == ' ' && isDrawn == true)
          {
             isDrawn = false;
          }
        }
      }
      else if(rand == 5 || rand == 10|| rand == 14|| rand == 18)
      {
        imageMode(CENTER);
        img = loadImage("desk v3 glow.png");
        image(img, 730, 567, 263, 160);
        if (keyPressed)  
        {
          if (key == ' ' && isDrawn == false)
          {
            background(0);
            imageMode(CORNER);
            img = loadImage("desk v3 zoom.png");
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
        img = loadImage("desk glow.png");
        image(img, 730, 567, 263, 160);
        if (keyPressed)  
        {
          if (key == ' ' && isDrawn == false)
          {
            background(0);
            imageMode(CORNER);
            img = loadImage("desk zoom.png");
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

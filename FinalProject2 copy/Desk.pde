class Desk
{
  PImage img;
  boolean isDrawn;
  float r;
  int rand = int(r);
  
  void establish()
  {
    tint(255, 255);
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
    tint(255, 255);
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
        img = loadImage("desk v1.png");
        image(img, 730, 567, 263, 160);

      
        if (keyPressed)  
        {

        }
      }
      else if(rand == 11 || rand == 13|| rand == 15|| rand == 19)
      {
        imageMode(CENTER);
        img = loadImage("desk v2.png");
        image(img, 730, 567, 263, 160);

        if (keyPressed)  
        {
          if (key == ' ' && isDrawn == false)
          {
            background(0);
            imageMode(CORNER);
            img = loadImage("desk v2 zoom.png");
            image(img, 0, 0, width, height);

           
          }
          if (key == ' ' && isDrawn == true)
          {

          }
        }
      }
      else if(rand == 5 || rand == 10|| rand == 14|| rand == 18)
      {
        imageMode(CENTER);
        img = loadImage("desk v3.png");
        image(img, 730, 567, 263, 160);

        if (keyPressed)  
        {
          if (key == ' ' && isDrawn == false)
          {
            background(0);
            imageMode(CORNER);
            img = loadImage("desk v3 zoom.png");
            image(img, 0, 0, width, height);

          }
          if (key == ' ' && isDrawn == true)
          {

          }
        }
      }
      else
      {
        imageMode(CENTER);
        img = loadImage("desk.png");
        image(img, 730, 567, 263, 160);

        if (keyPressed)  
        {
          if (key == ' ' && isDrawn == false)
          {
            background(0);
            imageMode(CORNER);
            img = loadImage("desk zoom.png");
            image(img, 0, 0, width, height);

          }
          if (key == ' ' && isDrawn == true)
          {

          }
        }
      }
    }
  }

}

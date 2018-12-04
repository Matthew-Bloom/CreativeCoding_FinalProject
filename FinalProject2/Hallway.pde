class Hallway
{
  PImage img;
  boolean isDrawn;
  float r;
  int rand = int(r);
  
  void establish()
  {
    tint(255, 255);
    if(rand == 6 || rand == 12 || rand == 18)
    {
      imageMode(CENTER);
      img = loadImage("hallway v1.png");
      image(img, 144, 474, 54, 54); 
    }
    else
    {
      imageMode(CENTER);
      img = loadImage("hallway.png");
      image(img, 144, 474, 54, 54); 
    }
  }
  
  void interact()
  {
    tint(255, 255);
    if(xPos < 420 || xPos > 510)
    {
      if(rand == 6 || rand == 12 || rand == 18)
      {
        imageMode(CORNER);
        img = loadImage("hallway v1.png");
        image(img, 420, 444, 89, 144); 
      }
      else
      {
        imageMode(CORNER);
        img = loadImage("hallway.png");
        image(img, 420, 444, 89, 144); 
      }
    }
    else if(xPos > 420 && xPos < 510 && yPos < 30)
    {
      if(rand == 6)
      {
        imageMode(CORNER);
        img = loadImage("hallway v1.png");
        image(img, 420, 444, 89, 144);
        if (keyPressed)  
        {
          spook.establish();
          if(!(scream.isPlaying()))
          {
            scream.play();
          }
        }
      }
      else if(rand == 12 || rand == 18)
      {
        imageMode(CORNER);
        img = loadImage("hallway v1.png");
        image(img, 420, 444, 89, 144);

        if (keyPressed)  
        {
          if (key == ' ' && isDrawn == false)
          {
            if(!(death.isPlaying()))
            {
              death.play();
            }
            fill(255, 0, 0);
            rect(0, 0, width, height);
            exit();
          }
        }
      }
      else
      {
        imageMode(CORNER);
        img = loadImage("hallway.png");
        image(img, 420, 444, 89, 144);
        if (keyPressed)  
        {
          if (key == ' ' && isDrawn == false)
          {
            background(0);
            imageMode(CORNER);
            img = loadImage("hallway zoom.png");
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

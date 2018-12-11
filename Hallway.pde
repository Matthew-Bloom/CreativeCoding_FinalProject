class Hallway
{
  PImage img;
  float r;
  int rand = int(r);
  
  void interact()
  {
    if(xPos > 420 && xPos < 510 && yPos < 30)
    {
      if(rand == 6)
      {
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
        if (keyPressed)  
        {
          if (key == ' ')
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
        if (keyPressed)  
        {
          if (key == ' ')
          {
            imageMode(CORNER);
            img = loadImage("hallway zoom.png");
            image(img, 0, 0, width, height);
          }
        }
      }
    }
  }
  


}

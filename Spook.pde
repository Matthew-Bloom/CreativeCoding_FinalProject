import processing.sound.*;

class Spook
{
  PImage img;
  int xPos2, yPos2;
  int tick = millis();

  void establish()
  {
    if(!(scream.isPlaying()))
    {
      scream.play();
    }
    imageMode(CORNER);
    img = loadImage("spook.gif");
    image(img, 0 + xPos2, 570 + yPos2, 71, 128);
    tint(255, 255);

    if (millis() > tick + 10)
    {
      move();
      tick = millis();
    }
  }
  
  
  void establishFinal()
  {
    imageMode(CORNER);
    img = loadImage("spook.gif");
    image(img, -100 + xPos2, 540 + yPos2, 71, 128);
    tint(255, 255);

    if (millis() > tick + 50)
    {
      moveFinal();
      tick = millis();
    }
  }
  
  void move()
  {
    if (xPos2 > xPos)
    {
      xPos2 = xPos2 - 20;
    }
    if (xPos2 < xPos)
    {
      xPos2 = xPos2 + 20;
    }

    if (yPos2 > yPos)
    {
      yPos2 = yPos2 - 20;
    }
    if (yPos2 < yPos)
    {
      yPos2 = yPos2 + 20;
    }

    if (xPos2 == xPos && yPos2 == yPos)
    {
      death.play();
      
      fill(255, 0, 0);
      rect(0, 0, width, height);
      exit();      
    }
  }
  
  void moveFinal()
  {
    if (xPos2 > xPos + 80)
    {
      xPos2 = xPos2 - 10;
    }
    if (xPos2 < xPos + 80)
    {
      xPos2 = xPos2 + 10;
    }
    if (yPos2 > yPos)
    {
      yPos2 = yPos2 - 10;
    }
    if (yPos2 < yPos)
    {
      yPos2 = yPos2 + 10;
    }
    println(xPos2 + " : " + yPos2);
    if (xPos2 == xPos + 80 && yPos2 == yPos)
    {
      xPos2 = xPos + 80;
      yPos2 = yPos;
      if((xPos2 > xPos + 80 || xPos2 < xPos + 80) || (yPos2 > yPos || yPos2 < yPos))
      {
        xPos2 = xPos + 80;
        yPos2 = yPos;
      }
      rect(0, 0, width, height);
      fill(0);
    }
  }
}

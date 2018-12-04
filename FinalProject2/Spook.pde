class Spook
{
  PImage img;
  int xPos2, yPos2;
  int tick = millis();

  void establish()
  {
    imageMode(CORNER);
    img = loadImage("spook.gif");
    image(img, 0 + xPos2, 570 + yPos2, 71, 128);

    if (millis() > tick + 5)
    {
      move();
      tick = millis();
    }
  }

  void establish2()
  {
    if (ambient.isPlaying())
    {
      ambient.stop();
    }
    spook.establish();
    if (!(scream.isPlaying()))
    {
      scream.play();
    }
    imageMode(CORNER);
    img = loadImage("spook.gif");
    image(img, 900 + xPos2, 570 + yPos2, 71, 128);

    if (millis() > tick + 5000)
    {
      move2();
      tick = millis();
    }
  }

  void establishLinear()
  {
    imageMode(CORNER);
    img = loadImage("spook.gif");
    image(img, 1050 + xPos2, yPos, 71, 128);

    if (millis() > tick + 5)
    {
      moveLinear();
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

  void move2()
  {
    if (xPos2 > xPos)
    {
      xPos2 = xPos2 - 5;
    }
    if (xPos2 < xPos)
    {
      xPos2 = xPos2 + 5;
    }

    if (yPos2 > yPos)
    {
      yPos2 = yPos2 - 5;
    }
    if (yPos2 < yPos)
    {
      yPos2 = yPos2 + 5;
    }

    if (xPos2 == xPos && yPos2 == yPos)
    {
      xPos2 = 100000;
      xPos2 = 100000;

      if (scream.isPlaying())
      {
        scream.stop();
      }
    }
  }

  void moveLinear()
  {
    if (ambient.isPlaying())
    {
      ambient.stop();
    }
    spook.establish();
    if (!(scream.isPlaying()))
    {
      scream.play();
    }
    for (int i = 0; i < 1000; i++)
    {
      xPos2 = xPos2 - 20;
    }

    if (xPos2 == xPos && yPos2 == yPos)
    {
      death.play();

      fill(255, 0, 0);
      rect(0, 0, width, height);
      exit();
    }
  }
}

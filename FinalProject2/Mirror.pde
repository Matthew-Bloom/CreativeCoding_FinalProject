class Mirror
{
  
  PImage img;
  
  void establish()
  {
    tint(255, 255);
      if((xPos == 380 || xPos == 400) && yPos >= 0) //Top Left
      {
        imageMode(CENTER);
        img = loadImage("mirror tl.png");
        image(img, 440, 490, 155, 194); 
      }
      else if(xPos == 420 && yPos >= 0) //Top Middle
      {
        imageMode(CENTER);
        img = loadImage("mirror tm.png");
        image(img, 440, 490, 155, 194); 
      }
      else if((xPos == 440 || xPos == 460) && yPos >= 0) //Top Right
      {
        imageMode(CENTER);
        img = loadImage("mirror tr.png");
        image(img, 440, 490, 155, 194); 
      }
      
      else if((xPos == 380 || xPos == 400) && (yPos >= -20 || yPos <= -40)) //Mid Left
      {
        imageMode(CENTER);
        img = loadImage("mirror ml.png");
        image(img, 440, 490, 155, 194); 
      }
      else if(xPos == 420 && (yPos >= -20 || yPos <= -40)) //True Middle
      {
        imageMode(CENTER);
        img = loadImage("mirror m.png");
        image(img, 440, 490, 155, 194); 
      }
      else if((xPos == 440 || xPos == 460) && (yPos >= -20 || yPos <= -40)) //Mid Right
      {
        imageMode(CENTER);
        img = loadImage("mirror mr.png");
        image(img, 440, 490, 155, 194); 
      }
      
      else if((xPos == 380 || xPos == 400) && (yPos == -60 || yPos == -80 || yPos == -100)) //Bottom Left
      {
        imageMode(CENTER);
        img = loadImage("mirror bl.png");
        image(img, 440, 490, 155, 194); 
      }
      else if(xPos == 420 && (yPos == -60 || yPos == -80 || yPos == -100)) //Bottom Middle
      {
        imageMode(CENTER);
        img = loadImage("mirror bm.png");
        image(img, 440, 490, 155, 194); 
      }
      else if((xPos == 440 || xPos == 460) && (yPos == -60 || yPos == -80 || yPos == -100)) //Bottom Right
      {
        imageMode(CENTER);
        img = loadImage("mirror br.png");
        image(img, 440, 490, 155, 194); 
      }
      
      else //Wherever else
      {
        imageMode(CENTER);
        img = loadImage("mirror.png");
        image(img, 440, 490, 155, 194); 
      }
    }
  }
  
  
  

import processing.sound.*;


PFont font;
PFont font2;
Desk desk = new Desk();
Hallway hallway = new Hallway();
Painting painting = new Painting();
Window window = new Window();
Ghost ghost = new Ghost();
Flicker flicker = new Flicker();
Mirror mirror = new Mirror();
Spook spook = new Spook();
PImage background;
boolean launched = false;
int xPos = 0;
int yPos = 0;
int x = 0;
int y = 0;

boolean spooked = false;
boolean haunted = false;

int timesReiterated = 0;
//int timesReiterated = 36;

SoundFile ambient;
SoundFile ambient2;
SoundFile ambient3;
SoundFile ambient4;
SoundFile step;
SoundFile scream;
SoundFile death;

//=====Setup=====
void setup()
{
  size(1000, 800); //Screen size.
  background(0);
  background = loadImage("title.png"); //Title screen.
  imageMode(CORNER);
  image(background, 0, 0);
  scream = new SoundFile(this, "aaaaa.wav");
  step = new SoundFile(this, "step.wav");
  ambient = new SoundFile(this, "ambient.wav");
  ambient2 = new SoundFile(this, "ambient2.wav");
  ambient3 = new SoundFile(this, "ambient3.wav");
  ambient4 = new SoundFile(this, "ambient4.wav");
  death = new SoundFile(this, "death.wav");
  step.amp(0.3);
  ambient.amp(0.5);
  ambient2.amp(0.5);
  ambient3.amp(0.5);
  scream.amp(0.4);
  tint(255, 255);
  
  font = createFont("Didot-Bold", 20); //The font used is to be clear and legible at a glance.
  textFont(font);
  
  font2 = createFont("Menlo-Bold", 30); //The font used is to be clear and legible at a glance.
  
  
}

//=====Player=====


void keyPressed() //Movement controls.
{
  if (key == CODED) 
  {
    if (keyCode == UP) 
    {
      if(!(step.isPlaying()))
      {
        step.play();
      }
      yPos -= 20;
      //println(xPos + ":" + yPos); //Purely for statistics and ease of troubleshooting, but also generally nice to have.
      if (yPos < -80)
      {
        yPos = -80;
      }
      if ((560 < xPos && xPos < 860) && yPos < -20)
      {
        yPos = -20;
      }
    } else if (keyCode == DOWN) 
    {
      if(!(step.isPlaying()))
      {
        step.play();
      }
      yPos += 20;
      //println(xPos + ":" + yPos); //Purely for statistics and ease of troubleshooting, but also generally nice to have.
      if (yPos > 10)
      {
        yPos = 10;
      }
    } else if (keyCode == LEFT) 
    {
      if(!(step.isPlaying()))
      {
        step.play();
      }
      xPos -= 20;
      //println(xPos + ":" + yPos); //Purely for statistics and ease of troubleshooting, but also generally nice to have.
      if (xPos < 0)
      {
        xPos = 0;
      }
      if ((560 < xPos && xPos < 860) && yPos < -20)
      {
        xPos = 860;
      }
    } else if (keyCode == RIGHT) 
    {
      if(!(step.isPlaying()))
      {
        step.play();
      }
      xPos += 20;
      //println(xPos + ":" + yPos); //Purely for statistics and ease of troubleshooting, but also generally nice to have.
      if ((560 < xPos && xPos < 860) && yPos < -20)
      {
        xPos = 560;
      }
    }

  }
}

//=====Iteration=====

void reiterate()
{
  if (xPos >= 1000)
  {
    //Reset everything and roll new rand values.
    if(scream.isPlaying())
    {
      scream.pause();
      scream.stop();
    }
    flicker.timer();
    xPos = 0;
    yPos = 0;
    desk.rand = int(random(0, 21));
    hallway.rand = int(random(0, 21));
    painting.rand = int(random(0, 21));
    window.rand = int(random(0, 21));
    spook.xPos2 = 0;
    spook.yPos2 = 0;
    ghost.gX2 = int(random(50, 950));
    ghost.gY2 = int(random(50, 750));
    
    timesReiterated++;

    ellipse(20 + xPos, 570 + yPos, 30, 30);
    rect(20 + (xPos - 15), 570 + (yPos + 15), 30, 90);
  }
}

void draw() //Meant to be the start menu.
{
  
  if ((mousePressed && mouseButton == LEFT) && launched == false)
  {
    
    if(timesReiterated % 3 == 0)
    {
      if(!(ambient.isPlaying()))
      {
        ambient.play();
      }
      background = loadImage("mockup.png");
      imageMode(CORNER);
      image(background, 0, 0, width, height);
      ghost.establish();
      flicker.timer();
    }
    else if(timesReiterated % 3 != 0)
    {
      {
        if(!(ambient.isPlaying()))
        {
          ambient.play();
        }
        background = loadImage("mockup2.png");
        imageMode(CORNER);
        image(background, 0, 0, width, height);
      }
    }
    launched = true;
  } 
  if (launched == true) //Only runs if the game is no longer on the title screen.
  {
    flicker.timer();
      if(timesReiterated <= 13) //Act 1
      {
        if(timesReiterated % 3 != 0)
        {
          if(!(ambient.isPlaying()))
          {
            ambient.play();
          }
          background = loadImage("mockup2.png");
          imageMode(CORNER);
          image(background, 0, 0, width, height);
          
          //desk.establish();
          desk.interact();
      
          //hallway.establish();
          hallway.interact();
      
         // painting.establish();
          painting.interact();
      
          //window.establish();
          window.interact();
          
       }
       else if((timesReiterated % 3 == 0) && timesReiterated != 15)
       {
         if(!(ambient.isPlaying()))
         {
           ambient.play();
         }
         background = loadImage("mockup.png");
         imageMode(CORNER);
         image(background, 0, 0, width, height);
         flicker.timer();
         mirror.establish();
         ghost.establish();
       }
        if(timesReiterated == 5)
        {
          background = loadImage("mockup3.png");
          imageMode(CORNER);
          image(background, 0, 0, width, height);
          if(xPos >= 666)
          {
            if(ambient.isPlaying())
            {
              ambient.stop();
            }
            spook.establish();
            if(!(scream.isPlaying()))
            {
              scream.play();
            }
            spooked = true;
          }
          if(xPos < 600 && spooked == true)
          {
            spook.establish();
          }
        }
     }
     if(timesReiterated > 13 && timesReiterated <= 23) //Act 2
     {
       if(ambient.isPlaying())
          {
            ambient.stop();
          }
          if(!(ambient2.isPlaying()))
          {
            ambient2.play();
          }
        if(timesReiterated == 14)
        {
          background = loadImage("mockupAct2a.png");
          imageMode(CORNER);
          image(background, 0, 0, width, height);
          fill(0, 200);
          rect(0, 0, width, height);
        }
        if(timesReiterated == 15)
        {
          background = loadImage("mockupAct2a.png");
          imageMode(CORNER);
          image(background, 0, 0, width, height);
          fill(0, 200);
          rect(0, 0, width, height);
        }
        if(timesReiterated == 16) 
        {
          
          
          background = loadImage("mockup3.png");
          imageMode(CORNER);
          image(background, 0, 0, width, height);
          fill(0, 150);
          rect(0, 0, width, height);
        }
        if(timesReiterated == 17)
        {
          
          background = loadImage("mockup3.png");
          imageMode(CORNER);
          image(background, 0, 0, width, height);
          fill(0, 100);
          rect(0, 0, width, height);
        }
        if(timesReiterated == 18)
        {
          fill(255);
          background = loadImage("mockupAct2a.png");
          imageMode(CORNER);
          image(background, 0, 0, width, height);
        }
        if(timesReiterated == 19)
        {
          background = loadImage("mockupAct2aa.png");
          imageMode(CORNER);
          image(background, 0, 0, width, height);
        }
        if(timesReiterated == 20)
        {
          background = loadImage("mockupAct2b.png");
          imageMode(CORNER);
          image(background, 0, 0, width, height);
        }
        if(timesReiterated == 21)
        {
          background = loadImage("mockupAct2b.png");
          imageMode(CORNER);
          image(background, 0, 0, width, height);
        }
        if(timesReiterated == 22)
        {
          background = loadImage("mockupAct2c.png");
          imageMode(CORNER);
          image(background, 0, 0, width, height);
        }
     }
     if(timesReiterated > 22 && timesReiterated <= 31) //Act 3
     {
       if(timesReiterated >= 23 && timesReiterated <= 30)
       {
          if(ambient2.isPlaying())
          {
            ambient2.stop();
          }
          if(!(ambient3.isPlaying()))
          {
            ambient3.play();
          }
         background = loadImage("mockup2.png");
         imageMode(CORNER);
         image(background, 0, 0, width, height);
         window.interact();
         desk.interact();
         hallway.interact();
         painting.interact();
         fill(0, 200);
         rect(0, 0, width, height);
       }
       if(timesReiterated == 31)
       {
         if(ambient3.isPlaying())
         {
           ambient3.stop();
         }
         if(!(ambient4.isPlaying()))
         {
           ambient4.play();
         }
         fill(255);
         background = loadImage("mockupAct3Begin.png");
         imageMode(CORNER);
         image(background, 0, 0, width, height);
       }
     }
     if(timesReiterated > 31 && timesReiterated <= 35) //Act 4 (Final)
     {
       if(ambient3.isPlaying())
       {
         ambient3.stop();
       }
       if(!(ambient4.isPlaying()))
       {
         ambient4.play();
       }
       if(timesReiterated == 32 || timesReiterated == 33 || timesReiterated == 34)
       {
         background = loadImage("mockupAct3a.png");
         imageMode(CORNER);
         image(background, 0, 0, width, height);
       }
       if(timesReiterated == 35)
       {
         background = loadImage("mockupAct3b.png");
         imageMode(CORNER);
         image(background, 0, 0, width, height);
       }
     }
     if(timesReiterated == 36) //Epilogue
     {
       background = loadImage("mockupFinal.png");
       imageMode(CORNER);
       image(background, 0, 0, width, height);
       fill(100, 0, 0, 100);
       rect(0, 0, width, height);
       fill(255);
       if(xPos >= 480)
       {
         xPos = 480;
         if(xPos > 480 || xPos < 480)
         {
           xPos = 480;
         }
         if(yPos >= -40)
         {
           yPos = -40;
           if(yPos > -40 || yPos < -40)
           {
             yPos = -40;
           }
         }
       }
       
       if(xPos == 480 && yPos == -40)
       {
         //Final Cutscene.
         
         if((yPos > -20 || yPos < -20) || (xPos > 500 || xPos < 500))
         {
           xPos = 500;
           yPos = -20;
         }
         spook.establishFinal();
         if(ambient4.isPlaying())
         {
           ambient4.stop();
         }
         if (spook.xPos2 == xPos + 80 && spook.yPos2 == yPos)
         {
           textFont(font2);
           fill(0);
           rect(0, 0, width, height);
           fill(255, 0, 0, random(25, 255));
           text("I love you.", width/2 - 100, height/2);
           fill(0);
         }
       }
     }
      
      
      
    
    
    
    
    
    //Act 1
    if(timesReiterated == 0)
    {
      if(xPos < 500)
      {
        text("I never meant to call you out.", 80, 80); 
      }
      if(xPos > 500)
      {
        
        text("I've always seen beyond your smoke and mirrors.", 80, 80);
      }
    }
    if(timesReiterated == 1)
    {
      if(xPos < 333)
      {
        text("Oh, sweetheart please don't yell at me,", 80, 80);
      }
      if(xPos > 333 && xPos < 666)
      {
        text("It really isn't hard to see", 160, 95);
      }
      if(xPos > 666)
      {
        text("The truth that's rotting underneath.", 240, 110);
      }
    }
    if(timesReiterated == 2 && xPos < 500)
    {
      ghost.establishMoving();
      text("Why weren't you honest from the start?", 80, 80);
    }
    if(timesReiterated == 2 && xPos > 500)
    {
      ghost.establishMoving();
      text("You know, I've always thought she must have liked you.", 80, 80);
    }
    if(timesReiterated == 3)
    {
      if(xPos < 333)
      {
        text("She's just a temptress, don't you know...", 80, 80);
      }
      if(xPos > 333 && xPos < 666)
      {
        text("...She says she loves you, even though...", 80, 80);
      }
      if(xPos > 666)
      {
        text("...She only wants to steal your soul.", 80, 80);
      }
    }
  if(timesReiterated == 4)
  {
    if(xPos < 333)
      {
        text("I'll", 80, 80);
      }
      if(xPos > 333 && xPos < 666)
      {
        ghost.establishMoving();
        text("save", 320, 100);
      }
      if(xPos > 666)
      {
        text("you.", 500, 80);
      }
  }
  
  if(timesReiterated == 5)
  {
    if(xPos < 666)
    {
      text("What's with that look?", 80, 80);
    }
    if(xPos > 666)
    {
      text("Do you really think I'm out of line tonight?", 80, 80);
    }
  }
  
  if(timesReiterated == 6)
    {
      if(xPos < 333)
      {
        text("Stop calling her name,", 80, 80);
      }
      if(xPos > 333 && xPos < 666)
      {
        ghost.establishMoving();
        text("If you play my game", 320, 100);
      }
      if(xPos > 666)
      {
        text("She may just make it out alive.", 500, 80);
      }
    }
    
    if(timesReiterated == 7)
  {
    text("I love you.", 80, 80);
    if(xPos > 666)
    {
      spook.establish();
      if(xPos < 666)
      {
        spook.establish();
      }
    }
  }
  if(timesReiterated == 8)
  {
    if(xPos < 666)
    {
      text("I'm not asking much, just give me your heart,", width/4, 80);
    }
    if(xPos > 666)
    {
      text("And put no one else above me.", width/2, 95);
    }
  }
  if(timesReiterated == 9)
  {
    if(xPos > 666)
    {
      spook.establish();
      if(xPos < 666)
      {
        spook.establish();
      }
    }
    text("Go on, say you love me.", 80, 80);
  }
  if(timesReiterated == 10)
  {
    text("Take my hand in yours and tell me that I'll always be the one.", 80, 80);
  }
  if(timesReiterated == 11)
  {
    text("Without you, my life means nothing, so just say you love me tonight.", 80, 80);
  }
  if(timesReiterated == 12)
  {
    if(xPos < 500)
    {
      text("And if you lie...", 80, 80);
    }
    if(xPos > 500)
    {
      text("...This poor girl will have to die!", 80, 80);
    }
  }
  //Act 2
  if(timesReiterated == 13)
  {
    if(xPos < 500)
    {
      text("I'm sorry that I lost my cool.", 80, 80);
    }
    if(xPos > 500)
    {
      text("As you can see here, I've been very busy.", 80, 80);
    }
  }
  if(timesReiterated == 14)
    {
      fill(255);
      if(xPos < 333)
      {
        text("I found her number in your phone,", 80, 80);
      }
      if(xPos > 333 && xPos < 666)
      {
        ghost.establishMoving();
        text("Asked her to meet me here alone...", 320, 100);
      }
      if(xPos > 666)
      {
        text("So we could talk, just one on one.", 500, 80);
      }
    }
  if(timesReiterated == 15)
  {
    fill(255);
    if(xPos < 500)
    {
      text("What's with that look?", 80, 80);
    }
    if(xPos > 500)
    {
      text("Do you really think I'm TAKING THIS TOO FAR?", 80, 80);
    }
  }
  if(timesReiterated == 16)
  {
    fill(255);
    if(xPos < 333)
    {
      text("All you have to do...", 80, 80);
    }
    if(xPos > 333 && xPos < 666)
    {
      ghost.establishMoving();
      text("...is swear that you'll be true...", 320, 100);
    }
    if(xPos > 666)
    {
      text("...and I will let her go right now.~", 500, 80);
    }
  }
  if(timesReiterated == 17)
  {
    fill(255);
    if(xPos < 333)
    {
      text("Just", width/4, 80);
    }
    if(xPos > 333 && xPos < 666)
    {
      ghost.establishMoving();
      text("don't", width/2, 80);
    }
    if(xPos > 666)
    {
      text("lie.", 3*width/4, 80);
    }
  }
  if(timesReiterated == 18)
  {
    fill(255);
    text("No, I won't fall for this again.", 80, 80);
  }
  if(timesReiterated == 19)
  {
    fill(255);
    text("I'll always see behind your smoke and mirrors.", 80, 80);
  }
  if(timesReiterated == 20)
  {
    fill(255);
    text("I know you love me deep inside,", 80, 80);
  }
  if(timesReiterated == 21)
  {
    fill(255);
    text("You're simply caught up in her lie,", 80, 80);
  }
  if(timesReiterated == 22)
  {
    fill(255);
    text("So I will cut you free myself.", width/3, 80);
  }
  //Act 3
  if(timesReiterated == 23)
  {
    fill(255);
    if(xPos < 333)
    {
      text("I'm not asking much, just give me your heart,", 80, 80);
    }
    if(xPos >= 333 && xPos <= 666)
    {
      text("And put no one else above me.", 380, 95);
    }
    if(xPos > 666)
    {
      text("Please, just say you love me!!", 580, 110);
    }

  }
  if(timesReiterated == 24)
  {
    fill(255);
    text("Take my hand in yours and tell me that I'll always be the one.", 80, 80);
  }
  if(timesReiterated == 25)
  {
    fill(255);
    text("Without you, my life means nothing, so just say you love me!", 80, 80);
  }
  if(timesReiterated == 26)
  {
    fill(255);
    text("Come on, what's the problem, quit your crying, be a man!", 80, 80);
  }
  if(timesReiterated == 27)
  {
    fill(255);
    text("Surely, she couldn't mean THAT much!", 80, 80);
  }
  if(timesReiterated == 28)
  {
    fill(255);
    text("Let me give you MY love!!", 80, 80);
  }
  if(timesReiterated == 29)
  {
    fill(255);
    text("Take my soul, my heart and body, yes, I give it all to you.", 80, 80);
  }
  if(timesReiterated == 30)
  {
    fill(255);
    text("And if you still won't accept it...", 80, 80);
  }
  if(timesReiterated == 31)
  {
    fill(255);
    text("You're gonna regret it.", 80, 80);
  }
  
  //Act Final
  if(timesReiterated == 32)
  {
    fill(255);
    text("I hate to play these games...", 80, 80);
  }
  if(timesReiterated == 33)
  {
    fill(255);
    text("But you're driving me insane...", 80, 80);
  }
  if(timesReiterated == 34)
  {
    fill(255);
    text("Won't you tell me that you'll stay...", 80, 80);
  }
  if(timesReiterated == 35)
  {
    fill(255);
    text("Now that she's not in the way!", 80, 80);
  }
  
  //Epilogue
  if(timesReiterated == 36)
  {
    
  }
     
      
      
      
    //Player character.
    ellipse(20 + xPos, 570 + yPos, 30, 30);
    rect(20 + (xPos - 15), 570 + (yPos + 15), 30, 90); 
  }
  if (xPos >= 1000) //Reboots the game with subtle, random changes.
  {
    reiterate();
  }
}

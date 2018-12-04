import processing.sound.*;



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
boolean canMove = true;
boolean ifHallway = false;
boolean ifWindow = false;
boolean ifPainting = false;
boolean ifDesk = false;

boolean spooked = false;
boolean haunted = false;

int timesReiterated = 0;

SoundFile ambient;
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
  death = new SoundFile(this, "death.wav");
  ambient.amp(0.3);
  scream.amp(0.4);
  tint(255, 255);
  
}

//=====Player=====


void keyPressed() //Movement controls.
{
  if (key == CODED) 
  {
    if (keyCode == UP) 
    {
      //player.translate(0, 10); //Up
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
      //player.translate(0, -10); //Down
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
      //player.translate(-10, 0); //Left
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
      //player.translate(10, 0); //Right
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
    //560 < xPos < 860
    //yPos < -20
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
    
    timesReiterated++;
    
    ;
    if (timesReiterated % 3 == 0 && timesReiterated != 0)
    {
      background = loadImage("mockup.png");
      imageMode(CORNER);
      image(background, 0, 0, width, height);
      //ghosty = loadImage("ghost.gif");
      //ghost.move();
      flicker.timer();
    }
    else
    {
      background = loadImage("mockup2.png");
      imageMode(CORNER);
      image(background, 0, 0, width, height);
    }

    //Draw and interact

      desk.establish();
      desk.interact();


    hallway.establish();
    hallway.interact();

    painting.establish();
    painting.interact();

    window.establish();
    window.interact();
    ellipse(20 + xPos, 570 + yPos, 30, 30);
    rect(20 + (xPos - 15), 570 + (yPos + 15), 30, 90);
    print("D" + desk.rand + " ");
    print("H" +hallway.rand + " "); //Purely for statistics and ease of troubleshooting, but also generally nice to have.
    print("P" +painting.rand + " ");
    println("W" +window.rand + " ");
    println("Reit" + timesReiterated + " ");
  }
}

/**
if (timesReiterated % 3 == 0)
    {
      background = loadImage("mockup.png");
      imageMode(CORNER);
      image(background, 0, 0, width, height);
      //ghosty = loadImage("ghost.gif");
      ghost.move();
      flicker.timer();
    }
    else
    {
      background = loadImage("mockup2.png");
      imageMode(CORNER);
      image(background, 0, 0, width, height);
    }
**/

void draw() //Meant to be the start menu.
{
  if ((mousePressed && mouseButton == LEFT) && launched == false)
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
      window.establish();
      desk.establish();
      hallway.establish();
      painting.establish();
    }
    else if(timesReiterated % 3 == 0)
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
    launched = true;
  } 
  if (launched == true) //Only runs if the game is no longer on the title screen.
  {
    if(timesReiterated == 5 || timesReiterated == 13 || timesReiterated == 25)
    {
      background = loadImage("mockup3.png");
      imageMode(CORNER);
      image(background, 0, 0, width, height);
      if(xPos >= 600)
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
    else if(timesReiterated == 15)
    {
      fill(0);
      rect(0, 0, width, height);
    }
    else if(timesReiterated == 16)
    {
      spook.establishLinear();
    }
    else
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
        
        desk.establish();
        desk.interact();
    
        hallway.establish();
        hallway.interact();
    
        painting.establish();
        painting.interact();
    
        window.establish();
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
        //ghost.move();
        flicker.timer();
        mirror.establish();
        ghost.establish();
      }
    }
    

    ellipse(20 + xPos, 570 + yPos, 30, 30);
    rect(20 + (xPos - 15), 570 + (yPos + 15), 30, 90);
  }
  if (xPos >= 1000) //Reboots the game with subtle, random changes.
  {
    reiterate();
  }
}

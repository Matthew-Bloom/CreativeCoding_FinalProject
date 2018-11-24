Desk desk = new Desk();
Hallway hallway = new Hallway();
Painting painting = new Painting();
Window window = new Window();
PImage background;
boolean launched = false;
int xPos = 0;
int yPos = 0;
int x = 0;
int y = 0;
boolean canMove = true;


//=====Setup=====
void setup()
{
  size(1000, 800); //Screen size.
  background(0);
  background = loadImage("title.png"); //Title screen.
  imageMode(CORNER);
  image(background, 0, 0);
  
}

//=====Player=====


void keyPressed() //Movement controls.
{
    if (key == CODED) 
    {
      if (keyCode == UP) 
      {
        //player.translate(0, 10); //Up
        yPos -= 20;
        //println(xPos + ":" + yPos); //Purely for statistics and ease of troubleshooting, but also generally nice to have.
        if(yPos < -80)
        {
          yPos = -80;
        }
        if((560 < xPos && xPos < 860) && yPos < -20)
        {
          yPos = -20;
        }
      } 
      else if (keyCode == DOWN) 
      {
        //player.translate(0, -10); //Down
        yPos += 20;
        //println(xPos + ":" + yPos); //Purely for statistics and ease of troubleshooting, but also generally nice to have.
        if(yPos > 10)
        {
          yPos = 10;
        }
      } 
      else if (keyCode == LEFT) 
      {
        //player.translate(-10, 0); //Left
        xPos -= 20;
        //println(xPos + ":" + yPos); //Purely for statistics and ease of troubleshooting, but also generally nice to have.
        if(xPos < 0)
        {
          xPos = 0;
        }
        if((560 < xPos && xPos < 860) && yPos < -20)
        {
          xPos = 860;
        }
        
      } 
      else if (keyCode == RIGHT) 
      {
        //player.translate(10, 0); //Right
        xPos += 20;
        //println(xPos + ":" + yPos); //Purely for statistics and ease of troubleshooting, but also generally nice to have.
        if((560 < xPos && xPos < 860) && yPos < -20)
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
    xPos = 0;
    yPos = 0;
    desk.rand = int(random(0, 21));
    hallway.rand = int(random(0, 21));
    painting.rand = int(random(0, 21));
    window.rand = int(random(0, 21));;
    if(desk.rand == 10)
    {
      background = loadImage("mockup.png");
      imageMode(CORNER);
      image(background, 0, 0, width, height);
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
    ellipse(20 + xPos, 570 + yPos, 30, 30);
    rect(20 + (xPos - 15), 570 + (yPos + 15), 30, 90);
    print("D" + desk.rand + " ");
    print("H" +hallway.rand + " "); //Purely for statistics and ease of troubleshooting, but also generally nice to have.
    print("P" +painting.rand + " ");
    println("W" +window.rand + " ");
  }
}

void draw() //Meant to be the start menu.
{
  if ((mousePressed && mouseButton == LEFT) && launched == false)
  {
    background = loadImage("mockup2.png");
    imageMode(CORNER);
    image(background, 0, 0, width, height);
    window.establish();

    launched = true;
  } 
  if(launched == true) //Only runs if the game is no longer on the title screen.
  {
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
    
    ellipse(20 + xPos, 570 + yPos, 30, 30);
    rect(20 + (xPos - 15), 570 + (yPos + 15), 30, 90);
    
  }
  if(xPos >= 1000) //Reboots the game with subtle, random changes.
  {
    reiterate();
  }
}

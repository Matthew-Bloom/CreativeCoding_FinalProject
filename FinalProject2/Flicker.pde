class Flicker
{

  int begin; 
  int duration = 10;
  int time1 = int(random(2, 10));
  int time2 = int(random(1, 4));
  int h;
  int here = 0;
  int away = -5000;
  int spooky = 3;

  void timer()
  {
    timer1();
  }
  
  
  
  void timer1() //Flicker off
  {
    if (time1 > 0)
    {
      time1 = duration - (millis() - begin)/1000;
      text(time1, 80, 80);
      //text(time2, 80, 90);
      h = away;
      if(time1 == 0)
      {
        h = here;
        fill(0);
        rect(h, h, h + 1000, h + 800); 
        timer2();
      }
    }
  }
  
  void timer2() //Flicker on
  {
    if (time2 > 0)
    {
      time2 = duration - (millis() - begin)/1000;
      //text(time1, 80, 80);
      text(time2, 80, 90);
      h = here;
      if(time2 == 0)
      {
        spooky++;
        h = away;
        //fill(255);
        rect(h, h, h + 1000, h + 800); 
        fill(255);
        timer1();
      }
    }
    
    if(spooky >= 3)
    {
      spook.establish();
    }
  }
  
  
}

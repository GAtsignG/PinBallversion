  // GUI library
  import controlP5.*;

  // Audio library
  import ddf.minim.*;
  import com.dhchoi.CountdownTimer;
  import com.dhchoi.CountdownTimerService;
  // Audio player
  Minim minim;
  AudioPlayer aClick;         // use in all Stages
  AudioPlayer aSweep;         // use in all Stages
  AudioPlayer bgmMenu;        // use in Stage 1/2/5
  AudioPlayer bgmGaming;      // use in Stage 3
  AudioPlayer bgmCeremony;    // use in Stage 4

  // stage switch function list
  boolean switchToSettings = false;
  boolean switchToGame = false;
  boolean switchToCeremony = false;
  boolean switchToCredit = false;
  
  // switch among setting sub-stages
  boolean switchTog = false;
  boolean switchToc = false;
  boolean switchToa = false;

  int p1;   //scores
  int p2;
  boolean p1Play; //player round

  // Font setting
  PFont formataB, formataI, formataBI;

  Mover mover;
  Barrier[] barriers = new Barrier[3];

void setup(){
 size(1920, 1080);
  frameRate(60);

  //-------------------------------------------------------
  //stage3
  showStage1();
  showStage2();
  showStage3();
  showStage4();
  showStage5();
    mover = new Mover();
   for (int i = 0; i< barrierNum; i++)
   {
     //xx是将地图整分为barrierNum份时，每份地图的宽度
    float xx = (1500-650)/barrierNum;
    barriers[i] = new Barrier(random(650+xx*i,650+xx*(i+1)),random(270,710),random(75,150), i, barriers);
   }
  
}

void keyPressed() {  // Pausing fuction, only available at Stage 3 Gaming
  final int k = keyCode;
 
 if (switchToGame && k == ' ')  //only pause while gaming
 {
   looping ^= k == ' ';  
   redraw = k == 'S';

  // Pausing notification
  fill(0, 120);
  rect(0, 0, 1920, 1080);

  fill(255);
  textFont(formataBI, 65);
  textAlign(CENTER);
  text("Pause", 960, 520);
    
  fill(255, 100);
  textFont(formataBI, 30);
  text("Press Space Bar to resume", 960, 570);
 }

 if (switchToGame)
 {
  if(key=='k')
  {
    if (!looping)
    {
      loop();
      round = true;
    }     
  }
 }

}

void draw(){

  // default show Stage 1 Menu
  if (!switchToGame && !switchToSettings && !switchToCredit)
  {
    drawStage1();
  }

  
  if (!switchToSettings && switchToGame)  // switch to Stage 3 Gaming
  {
    drawStage3();
  }

  // Setting page's sub-stage switching conditions
  if (switchToSettings && switchToa)  // switch to 2 Setting
  {
      drawStage2a();   
  }
   
  if (switchToSettings && switchToc)  // switch to Controller Setting
  {
      drawStage2c();   
  }
  
  if (switchToSettings && switchTog)  // switch to Game Setting
  {
      drawStage2g();   
  }

  if (switchToCredit)  // switch to Game Setting
  {
      drawStage5();   
  }
}

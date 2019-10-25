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
  AudioPlayer aCollision;     // use in all Stages 3
  AudioPlayer bgmMenu;        // use in Stage 1/2/5
  AudioPlayer bgmGaming;      // use in Stage 3
  AudioPlayer bgmCeremony;    // use in Stage 4

  // stage switch function list
  boolean switchToSettings = false;
  boolean switchToGame = false;
  boolean switchToCeremony = false;
  boolean switchToCredit = false;
  boolean switchToFinal = false;
  // switch among setting sub-stages
  boolean switchTog = false;
  boolean switchToc = false;
  boolean switchToa = false;
  
  int p1;   //scores
  int p2;
  boolean p1Play; //player round

  // Font setting
  PFont formataR, formataB, formataI, formataBI, numFont;

  Mover mover;
  Barrier[] barriers = new Barrier[5];

void setup(){
 size(1920, 1080);
  frameRate(60);
  // Load all fonts
  formataR = createFont("Formata-Regular.otf", 32);
  formataB = createFont("Formata-Bold.otf", 32);
  formataI = createFont("Formata-Italic.otf", 32);
  formataBI = createFont("Formata-BoldItalic.otf", 32);
  numFont = createFont("Gotham-UltraItalic.otf", 32);

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
void mousePressed()
{
  if (switchToCeremony)
  {
  switchToFinal = true;
  switchToCeremony = false;
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
  textFont(formataI, 30);
  text("Press Space Bar to resume", 960, 570);
  textFont(formataBI, 30);
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
  if(key == 'c')
  {
    p1 = 2;  //cheat
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

  if (switchToCredit)  // switch to 5 Credits
  {
    drawStage5();   
  }

  if (switchToCeremony && !switchToGame)  //switch to Ceremony
  {
    drawStage4a(); 
  }

   if (switchToFinal && !switchToGame)  //switch to Final
  {
    drawStage4b(); 
  }
}

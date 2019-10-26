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
  AudioPlayer aWhistle;       // use in all Stages 3
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

  //mute
  boolean mute = false;
  
  int p1;   //scores
  int p2;
  boolean p1Play; //player round

  // Font setting
  PFont formataR, formataB, formataI, formataBI, numFont;

  // Cursor img
  PImage cursorG;

  Mover mover;
  Barrier[] barriers = new Barrier[5];
  
  ParticleSystem ps;
  ParticleSystem ps2;
  PVector gravity;
  StarField sf;
ArrayList<Explosion> explosion;
ArrayList<Rocket> rocket;
ArrayList<City> city;

  //particle system

void setup(){
  
  size(1920, 1080);
  frameRate(60);
  // Load all fonts
  formataR = createFont("Formata-Regular.otf", 32);
  formataB = createFont("Formata-Bold.otf", 32);
  formataI = createFont("Formata-Italic.otf", 32);
  formataBI = createFont("Formata-BoldItalic.otf", 32);
  numFont = createFont("Gotham-UltraItalic.otf", 32);

  // Load & change cursor image
  cursorG = loadImage("Cursor_0.png");
  cursor(cursorG);

  //-------------------------------------------------------
  //stage3
  showStage1();
  showStage2();
  showStage3();
  showStage4();
  showStage5();
  // cp5 = new ControlP5(this);
  // cp5.addIcon("icon",10)
  //    .setPosition(933, 455)
  //    .setSize(70,50)
  //    .setRoundedCorners(20)
  //    .setFont(createFont("fontawesome-webfont.ttf", 40))
  //    .setFontIcons(#00f205,#00f204)
  //    .setColorBackground(color(255,100))
  //    .setSwitch(true);
     //.hideBackground();
     
  //particle system
 explosion = new ArrayList<Explosion>();
 rocket = new ArrayList<Rocket>();
 smooth();
      // int xWidth = 1620;
      // int x = 340;
      // int yHeight = 980;
      // int y = 120;
  ps = new ParticleSystem(new PVector(1620,980));
  ps2 = new ParticleSystem(new PVector(340,120));
  sf = new StarField();

    mover = new Mover();
   for (int i = 0; i< barrierNum; i++)
   {
     //xx是将地图整分为barrierNum份时，每份地图的宽度
     //yy用来判断i的奇偶性从而使障碍物更分散，偶数在上，奇数在下
    float xx = (1500-650)/barrierNum;
    float yy;
    if(i%2 == 0)
    {
      yy = random(270,430);
    }
    else
    {
      yy = random(550,710);
    }
    barriers[i] = new Barrier(random(650+xx*i,650+xx*(i+1)),yy,random(150,200), i, barriers);
   }
}

// jump to Stage4b
void mousePressed()
{
  if (switchToCeremony)
  {
  switchToFinal = true;
  switchToCeremony = false;
  }

  if (trans && !switchToCeremony)
 {
    switchToCeremony = true;
    switchToGame = false;
    trans = false;
 }
 if(switchToSettings && switchTog)
 {
   if(mouseX > 925 && mouseX < 1175)
   {
     if(mouseY > 460 && mouseY < 520)
     {
       mute = !mute;
     }
     
   }
 }
}

void keyPressed() {  // Pausing fuction, only available at Stage 3 Gaming
  final int k = keyCode;
 
 if (switchToGame && k == 'P')  //only pause while gaming
 {
   looping ^= k == 'P';  
   redraw = k == 'K';

  // Pausing notification
  fill(0, 120);
  rect(0, 0, 1920, 1080);

  fill(255);
  textFont(formataBI, 65);
  textAlign(CENTER);
  text("Paused", 960, 520);
    
  fill(255, 100);
  textFont(formataI, 30);
  text("Press P to resume", 960, 570);
  textFont(formataBI, 30);
 }

 // next round
 if (switchToGame)
 {
  if(key==' ')
  {
    if (!looping)
    {
      loop();
      round = true;
    }     
  }

  // cheat fuction, only use to testing
  if(key == 'c')
  {
    p1 = 5;
  }
 }

}

void draw(){

  // default show Stage 1 Menu
  if (!switchToGame && !switchToSettings && !switchToCredit)
  {
    //cp5.hide();
    drawStage1();
  }

  
  if (!switchToSettings && switchToGame)  // switch to Stage 3 Gaming
  {
    //cp5.hide();
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
    //cp5.hide();
    drawStage4a(); 
  }

   if (switchToFinal && !switchToGame)  //switch to Final
  {
    //cp5.hide();
    drawStage4b(); 
  }

  if (switchToSettings && switchToa)  // switch to 2 Setting
  {
    //gui();
    //cp5.show();
  }
  if (!switchToSettings && !switchToa)
  {
    //cp5.hide();
  }
}

void clickSound()
{
  aClick.rewind();
  aClick.play();
}

void collisionSound()
{
  aCollision.rewind();
  aCollision.play();

}

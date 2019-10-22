  // GUI library
  import controlP5.*;

  // Audio library
  import ddf.minim.*;

  // Audio player
  Minim minim;
  AudioPlayer aClick;         // use in all Stages
  AudioPlayer bgmMenu;        // use in Stage 1/2/5
  AudioPlayer bgmGaming;      // use in Stage 3
  AudioPlayer bgmCeremony;    // use in Stage 4

  // switch function list
  boolean switchToSettings = false;
  boolean switchToGame = false;
  boolean switchToCeremony = false;

  // Font setting
  PFont formataB, formataI, formataBI;


Mover mover;
Barrier[] barriers = new Barrier[3];

void setup(){
 size(1920, 1080);
  frameRate(60);

  //load all materials file
  img1BG = loadImage("Stage1_BG_Menu.jpg");
  img1Logo = loadImage("Stage1_Logo.png");
  
  //-------------------------------------------------------
  //stage3
  showStage1();
  showStage2();
  showStage3();

    mover = new Mover();
   for (int i = 0; i< barrierNum; i++)
   {
    barriers[i] = new Barrier(random(200,width/2),random(200,height-200),random(100,200), i, barriers);
   }
  
  
}

void keyPressed() {
  final int k = keyCode;

 if (switchToGame)  //only pause while gaming
 {
   looping ^= k == 'P';  
   redraw = k == 'S';
 }
  
}

void draw(){
  // default show Stage 1 Menu
  if (!switchToGame && !switchToSettings)
  {
    drawStage1();
  }
  
  if (switchToSettings)  // switch to 2 Setting
  {
    drawStage2a();
  }
  
  if (switchToGame)  // switch to 3 Gaming
  {
    drawStage3();
  }


}

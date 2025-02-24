  /*
  * this page is for Game Page
  */

  // Image var
  PImage img3BGframe, img3BGgrass, img3BGAudience;

  // Buttons
  Button pauseButton, backGButton, resumeButton;
  boolean pause = false;

void showStage3(){
  // image load
  img3BGframe = loadImage("Stage3_BG_Frame.png");
  img3BGgrass = loadImage("Stage3_BG_Grass.jpg");
  img3BGAudience = loadImage("Stage3_BG_Audience.png");

  // bgm load
  bgmGaming = minim.loadFile("bgm_Gaming.mp3");

  // font load
  formataB = loadFont("Formata-Bold-48.vlw");
  formataI = loadFont("Formata-Italic-48.vlw");
  formataBI = loadFont("Formata-BoldItalic-48.vlw");  

  // Buttons             (Pos.x, Pos.y, Width, Height, radius, Text, R, G, B, Alpha)
  textFont(formataBI);
  pauseButton = new Button(1700, 850, 200, 50, 100, "Pause", 129, 200, 177);
  backGButton = new Button(1700, 930, 200, 50, 100, "Back", 129, 200, 177);
  //resumeButton = new Button(1700, 850, 200, 50, 100, "Resume", 129, 200, 100);  

  // 此处需要画一个3/5秒倒计时，先试试五秒看哪个比较合适
}

void drawStage3(){

  image(img3BGgrass, 0, 0);
  image(img3BGframe, 0, 0);
  image(img3BGAudience, 0, 0);

  if (switchToGame){
   bgmGaming.play();
  }
  
  /*
  // Pausing screen notification
  textFont(formataBI, 65);
  textAlign(CENTER);
  text("Pause", height/2, width/2);
  */
  for(Barrier barrier : barriers)
  {
    barrier.display();
    /*if(barrier.barrierReflect(mover.getPosition()))
    {
      mover.changeReflection();
    }
    */
    barrier.barrierReflect();
  }
  mover.update();
  //mover.checkEdges();
  mover.display();

  if(pauseButton.isClicked() ){  // if pause button is clicked, change text to Resume & change function
      clickSound();

    //int k = keyCode;
      //looping ^= k == 'P'; //pause with key "P"
  }

  if(backGButton.isClicked() ){  // switch to Stage 1 Menu
    clickSound();
    if (switchToGame)
    {
      switchToGame = false;
    }
 }
  

  //pauseButton.update();
  //pauseButton.render();
  backGButton.update();
  backGButton.render();
}

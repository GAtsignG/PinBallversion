/*
  * this page is the settings for Game Page
  */

  // Image var
  PImage img3BGframe, img3BGgrass, img3BGAudience;
  PImage barriersImage[];
  boolean startGame = false;

  //set a countdown timer before the game beginning
  CountdownTimer timer = CountdownTimerService.getNewCountdownTimer(this).configure(1000, 5000);
  int countNum = 3; //displayer count down number starts with 3
  String countInfo = ""; //display information when the countdown finishes

  // Buttons
  Button pauseButton, backGButton, resumeButton;
  boolean pause = false;

void showStage3(){
  
  timer.start(); // start the timer

  // image load
  img3BGframe = loadImage("Stage3_BG_Frame.png");
  img3BGgrass = loadImage("Stage3_BG_Grass.jpg");
  img3BGAudience = loadImage("Stage3_BG_Audience.png");


  for (int i = 0; i < 8; i++)
  {
      //barriersImage[i] = loadImage(+i+".png");
  }
  // bgm load
  bgmGaming = minim.loadFile("bgm_Gaming.mp3");

  // // font load
  // formataB = loadFont("Formata-Bold-48.vlw");
  // formataI = loadFont("Formata-Italic-48.vlw");
  // formataBI = loadFont("Formata-BoldItalic-48.vlw");  

  // Buttons             (Pos.x, Pos.y, Width, Height, radius, Text, R, G, B, Alpha)
  textFont(formataBI);
  pauseButton = new Button(1700, 850, 200, 50, 100, "Start", 129, 200, 177);
  backGButton = new Button(1700, 930, 200, 50, 100, "Back", 129, 200, 177);
  
}

void drawStage3(){  // Gaming zone setting

  image(img3BGgrass, 0, 0);
  image(img3BGframe, 0, 0);
  image(img3BGAudience, 0, 0);
  
  // Countdown timer
  if(!startGame)
  {
    fill(0, 120);
    rect(0, 0, 1920, 1080);
    fill(255);
    textFont(formataBI, 100);
    textAlign(CENTER);
    text(countInfo, 960, 520);
  }
  

  if (switchToGame){
   bgmGaming.play();
  }
  
  if (startGame)
  {
   mover.update();
   //mover.checkEdges();
   mover.display();
   mover.score();
   mover.goalCheck();
  }

  // barrier setting
  for(Barrier barrier : barriers)
  {
    barrier.display();
    mover.checkCollision(barrier);  //check collision
    
    /*if(barrier.barrierReflect(mover.getPosition()))
    {
      mover.changeReflection();
    }
    */
    //barrier.barrierReflect();
 
  }

  if(backGButton.isClicked() ){  // switch to Stage 1 Menu
    clickSound();
      switchToGame = false;
 
 }
  pauseButton.update();
  pauseButton.render();
  backGButton.update();
  backGButton.render();
 
}
void onTickEvent(CountdownTimer t, long timeLeftUntilFinish) 
{
  //timerCallbackInfo = "[tick] - timeLeft: " + timeLeftUntilFinish + "ms"; 
    if (countNum == 0)
  {
    countInfo = "Start !";
  }
  else
  {
    countInfo = str(countNum);
  }
  countNum--;
}

void onFinishEvent(CountdownTimer t) {
  countInfo = "Start !";   //or something to remind the player
  startGame = true;
}

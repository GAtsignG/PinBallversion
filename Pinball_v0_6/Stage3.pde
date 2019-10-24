/*
  * this page is the settings for Game Page
  */

  // Image var
  PImage img3BGframe, img3BGgrass, img3BGAudience;
  //PImage barriersImage[];
  PImage barrierImg1,barrierImg2,barrierImg3,barrierImg4,barrierImg5,barrierImg6,barrierImg7,barrierImg8,barrierImg9,pick;
  boolean startGame = false;
  boolean player1 = true;
  boolean pause = false;
  boolean round = false;

  //set a countdown timer before the game beginning
  CountdownTimer timer = CountdownTimerService.getNewCountdownTimer(this).configure(1000, 5000);
  CountdownTimer timeLimit = CountdownTimerService.getNewCountdownTimer(this).configure(1000, 5000);
  int countNum = 3; //displayer count down number starts with 5
  String countInfo = ""; //display information when the countdown finishes
  int roundTime = 10; //display each round's time limit
  // Buttons
  Button pauseButton, backGButton, resumeButton;
  
 

void showStage3(){
  
  // image load
  // img3BGframe = loadImage("Stage3_BG_Frame.png");
  // img3BGgrass = loadImage("Stage3_BG_Grass.jpg");
  // img3BGAudience = loadImage("Stage3_BG_Audience.png");

  // barrierImg1 = loadImage("1.png");
  // barrierImg2 = loadImage("2.png");
  // barrierImg3 = loadImage("3.png");
  // barrierImg4 = loadImage("4.png");
  // barrierImg5 = loadImage("5.png");
  // barrierImg6 = loadImage("6.png");
  // barrierImg7 = loadImage("7.png");
  // barrierImg8 = loadImage("8.png");
  // barrierImg9 = loadImage("9.png");
  // if(barrierImg == 1)
  // {
  //   pick = barrierImg1;
  // }
  // if(barrierImg ==2)
  // {
  //   pick = barrierImg2;
  // }
  // if(barrierImg == 3)
  // {
  //   pick = barrierImg3;
  // }
  // if(barrierImg == 4)
  // {
  //   pick = barrierImg4;
  // }
  // if(barrierImg == 5)
  // {
  //   pick = barrierImg5;
  // }
  // if(barrierImg == 6)
  // {
  //   pick = barrierImg6;
  // }
  // if(barrierImg == 7)
  // {
  //   pick = barrierImg7;
  // }
  // if(barrierImg == 8)
  // {
  //   pick = barrierImg8;
  // }
  // if(barrierImg == 9)
  // {
  //   pick = barrierImg9;
  // }
  // for (int i = 0; i < 8; i++)
  // {
  //     //barriersImage[i] = loadImage(+i+".png");
  // }
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
  //image(barriersImage[0], 0, 0);
// 此处需要画一个3/5秒倒计时，先试试五秒看哪个比较合适

  if(!startGame)
  {
   p1 = 0;   //scores
   p2 = 0;
  fill(0, 120);
  rect(0, 0, 1920, 1080);
  fill(255);
  textFont(formataBI, 65);
  textAlign(CENTER);
  text(countInfo, 960, 520);
  }
   
  if (switchToGame){
   bgmGaming.play();
  }
  
  if(!round)
  {
    timeLimit.start();   //start the timer of each round 10s
    round = true;
  }
   
if (startGame)
{
  mover.update();
  //mover.checkEdges();
  mover.display();
  mover.goalCheck();
  mover.score();
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
      bgmGaming.pause();
      startGame = false;
      countNum = 3;  //restart the game
      switchToGame = false;
 
 }
  pauseButton.update();
  pauseButton.render();
  backGButton.update();
  backGButton.render();
 
}

// countdown timer at the beginning of the game
void onTickEvent(CountdownTimer t, long timeLeftUntilFinish) 
{
  if (t.getId() == 0)
  {
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
  //timerCallbackInfo = "[tick] - timeLeft: " + timeLeftUntilFinish + "ms"; 
  if (t.getId() == 1)
  {
    roundTime--; //each round limts in 10 sceounds
  }
}

void onFinishEvent(CountdownTimer t) {
  //countInfo = "Start !";   //or something to remind the player
  if (t.getId() == 0)
  {
    startGame = true; 
  }
  if (t.getId() == 1)
  {
    round = false;
    mover.nextGame();
  }
}

/*
  * this page is the settings for Game Page
  */

  // Image var
  PImage img3BGframe, img3BGgrass, img3BGAudience;
  //PImage barriersImage[];
  //障碍物图片生成
  PImage barrierImg1,barrierImg2,barrierImg3,barrierImg4,barrierImg5,barrierImg6,barrierImg7,barrierImg8,barrierImg9,pick,barrierShadow;
  //球员图片生成
  PImage defenseP1, defenseP2;
  boolean startGame = false;
  boolean player1 = true;
  boolean pause = false;
  boolean round;
  boolean roundCount = false;

  //set a countdown timer before the game beginning
  CountdownTimer timer = CountdownTimerService.getNewCountdownTimer(this).configure(1000, 3000);
  CountdownTimer timeLimit = CountdownTimerService.getNewCountdownTimer(this).configure(1000, 10000);
  int countNum = 3; //displayer count down number starts with 5
  String countInfo = ""; //display information when the countdown finishes
  int roundTime = 10; //display each round's time limit
  // Buttons
  Button pauseButton, backGButton, resumeButton;
  int barrierImg = (int) random(1,9);
  
  Defender d;

void showStage3(){
  
  // image load
  img3BGframe = loadImage("Stage3_BG_Frame.png");
  img3BGgrass = loadImage("Stage3_BG_Grass.jpg");
  img3BGAudience = loadImage("Stage3_BG_Audience.png");
  //球员图片加载
  defenseP1 = loadImage("Stage3_Player1.png");
  defenseP2 = loadImage("Stage3_Player2.png");
  //障碍物图片加载
  barrierImg1 = loadImage("1.png");
  barrierImg2 = loadImage("2.png");
  barrierImg3 = loadImage("3.png");
  barrierImg4 = loadImage("4.png");
  barrierImg5 = loadImage("5.png");
  barrierImg6 = loadImage("6.png");
  barrierImg7 = loadImage("7.png");
  barrierImg8 = loadImage("8.png");
  barrierImg9 = loadImage("9.png");
  barrierShadow = loadImage("Stage3_BarrierShadow.png");
  if(barrierImg == 1)
  {
    pick = barrierImg1;
  }
  if(barrierImg ==2)
  {
    pick = barrierImg2;
  }
  if(barrierImg == 3)
  {
    pick = barrierImg3;
  }
  if(barrierImg == 4)
  {
    pick = barrierImg4;
  }
  if(barrierImg == 5)
  {
    pick = barrierImg5;
  }
  if(barrierImg == 6)
  {
    pick = barrierImg6;
  }
  if(barrierImg == 7)
  {
    pick = barrierImg7;
  }
  if(barrierImg == 8)
  {
    pick = barrierImg8;
  }
  if(barrierImg == 9)
  {
    pick = barrierImg9;
  }
  for (int i = 0; i < 8; i++)
  {
      //barriersImage[i] = loadImage(+i+".png");
  }
  // bgm load
  bgmGaming = minim.loadFile("bgm_Gaming.mp3");

  // Buttons             (Pos.x, Pos.y, Width, Height, radius, Text, R, G, B, Alpha)
  textFont(formataBI);
  pauseButton = new Button(1700, 850, 200, 50, 100, "Start", 129, 200, 177);
  backGButton = new Button(1700, 930, 200, 50, 100, "Back", 129, 200, 177);
  
}

void drawStage3(){  // Gaming zone setting
  
  
  image(img3BGgrass, 0, 0);
  image(img3BGframe, 0, 0);
  image(img3BGAudience, 0, 0);

// 此处需要画一个3/5秒倒计时，先试试五秒看哪个比较合适
  //break;	
  //防守功能
  d = new Defender();
  d.defenseKeyPressed();
  d.defensePlayer();
  //防守按键
  

  if (startGame) //now the first round starts
 {
  mover.update();
  //mover.checkEdges();
  mover.display();
  mover.goalCheck();
  mover.score();
 }
 d.saveBall(mover);

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

  if(!startGame)
  {
  fill(0, 120);  //countdown lable
  rect(0, 0, 1920, 1080);
  fill(255);
  textFont(formataBI, 65);
  textAlign(CENTER);
  text(countInfo, 960, 520);
  }


  if(round && startGame)
  {
    timeLimit.reset(CountdownTimer.StopBehavior.STOP_AFTER_INTERVAL);
    timeLimit.start();   //start the timer of each round 10s
    round = false;
  }
   

  if(backGButton.isClicked() ){  // switch to Stage 1 Menu
    clickSound();
      bgmGaming.pause();
      bgmGaming.rewind();
      bgmMenu.play();

      timer.stop(CountdownTimer.StopBehavior.STOP_AFTER_INTERVAL);
      timeLimit.stop(CountdownTimer.StopBehavior.STOP_AFTER_INTERVAL);
      timer.reset(CountdownTimer.StopBehavior.STOP_AFTER_INTERVAL);
      timeLimit.reset(CountdownTimer.StopBehavior.STOP_AFTER_INTERVAL);
      startGame = false;
      countNum = 3;  //restart the game
      switchToGame = false;
      round = false;
 
 //refresh the mover and barriers
 mover = new Mover();
        mover.nextGame();
        for (int i = 0; i< barrierNum; i++)
        {
          float xx = (1500-650)/barrierNum;
          barriers[i] = new Barrier(random(650+xx*i,650+xx*(i+1)),random(270,710),random(75,150), i, barriers);
         }
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
    //countInfo = str(roundTime);

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
      confirmNext();
      if(p1Play)
    {          
      //交换球权
      p1++;
      p1Play = false;
    }
    else
    {           
      //交换球权
      p2++;
      p1Play = true;
    } 
      mover.nextGame(); //overtime !!!       
  }
}

void confirmNext()
{
  // Pausing notification
  fill(0, 120);
  rect(0, 0, 1920, 1080);

  fill(255);
  textFont(formataBI, 65);
  textAlign(CENTER);
  text("Next round?", 960, 520);
    
  fill(255, 100);
  textFont(formataBI, 30);
  text("Press K to start", 960, 570);
  
  noLoop();
}

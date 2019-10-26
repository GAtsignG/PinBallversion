//this page is the settings for Menu interface

// Image var
PImage img0BG, img1Logo;

// Buttons
Button startButton, settingButton, creditsButton, quitButton;

// verify bgm is playing or not
boolean bp = true;

void showStage1(){
  // load imgs of Stage 1 (Stage 0 represent General BG)
  img0BG = loadImage("Stage0_General_BG.jpg");
  img1Logo = loadImage("Stage1_Logo.png");
  
  // bgm load
  if(!mute)
  {
    minim = new Minim(this);
    bgmMenu = minim.loadFile("bgm_Menu&Setting.mp3");
    bgmMenu.loop();
  }
  // sfx load
  aClick = minim.loadFile("a_click.wav");
  aSweep = minim.loadFile("a_sweep.wav");
  
  // Buttons             (Pos.x, Pos.y, Width, Height, radius, Text, R, G, B, Alpha)
  textFont(formataBI);
  startButton = new Button(860, 730, 200, 50, 100, "Start", 129, 200, 177);
  settingButton = new Button(860, 800, 200, 50, 100, "Setting", 129, 200, 177);
  creditsButton = new Button(860, 870, 200, 50, 100, "Credits", 129, 200, 177);
  quitButton = new Button(860, 970, 200, 50, 100, "Quit", 129, 200, 177);
}

void mouseMoved(){
  /*根据鼠标的位置来更新消失点的位置
    达到改变视角的目的*/
  sf.updateEndpoint(mouseX, mouseY);
}

void drawStage1(){
  image(img0BG, 0, 0);
  image(img1Logo, 750, 100);
  sf.run();
  sf.speedDown();
  sf.speedDown();
  //firework
  //ps.addParticle();
  //ps.applyForce(gravity);
  //ps.run();
  //rectMode(CORNER);

  if(startButton.isClicked() ){  // switch to Stage 3 Gaming
    clickSound();
    if(!mute)
    {
      bgmMenu.pause();
      bgmMenu.rewind();
      bgmGaming.loop();
    }
    trans = false;
    switchToGame = true;
    p1Play = false;
    round = true;
    p1 = 0;   //scores
    p2 = 0;
    timer.start(); // the timer to count down 3s to start the game
  }
  
  if(settingButton.isClicked() ){  // switch to Stage 2 Setting
    switchToSettings = true;
    switchToa = true;
    clickSound();   
  }
  
  if(creditsButton.isClicked() ){  // switch to Stage 5 Credits
    clickSound();
    switchToCredit = true;
  }
  
  if(quitButton.isClicked() ){  // end game
    clickSound();
    exit();
  }
  
  startButton.update();
  startButton.render();
  settingButton.update();
  settingButton.render();
  creditsButton.update();
  creditsButton.render();
  quitButton.update();
  quitButton.render();

}

  /*
  * this page is the settings for Score & Ceremony Page
  */

  // Image var
  PImage img4CoverScore, img4CoverResult, img4Winner;

  // Buttons
  Button playAgainButton, menuButton;

void showStage4(){  // 默认显示Stage4a ↓↓↓↓
  // image load
  img4CoverScore = loadImage("Stage4_Cover_ShwoScore.png");
  img4CoverResult = loadImage("Stage4_Cover_Result.png");
  img4Winner = loadImage("Stage4_Winner.png");

  // bgm load
  bgmCeremony = minim.loadFile("bgm_Ceremoney.mp3");

  // Buttons  (Pos.x, Pos.y, Width, Height, radius, Text, R, G, B, Alpha)
  textFont(formataBI);
  playAgainButton = new Button(1300, 500, 250, 50, 100, "Play Again", 129, 200, 177);
  menuButton = new Button(1300, 600, 250, 50, 100, "Menu", 129, 200, 177);

}

void drawStage4a(){  // only display score

  image(img0BG, 0, 0);
  fill(0, 120);
  rect(0, 0, 1920, 1080);
  image(img4CoverScore, 0, 0);

  // 屏幕正中间的冒号，用于区分两个player的分数
  fill(255);
  rect(width/2, 500, 60, 60);  // score split symbol, 冒号
  rect(width/2, 600, 60, 60);

  // 读取BallMoves里的分数，分别显示在冒号两边
  textFont(numFont, 140);
  fill(239, 75, 75);
  text(p1, 860, height/2);
  fill(62, 137, 218);
  text(p2, 1060, height/2);
  textFont(formataBI);


  // text on the buttom center, gray color
  fill(50, 50, 50);
  textFont(formataBI, 20);
  textAlign(CENTER);
  text("Click anywhere to continue", width/2, 970);

  // 从
  if (switchToCeremony)
  {
   bgmCeremony.play();
  }
  
}
// 过渡到下一个画面

void drawStage4b(){  // display ceremoney screen

  image(img0BG, 0, 0);
  fill(0, 120);
  rect(0, 0, 1920, 1080);
  image(img4CoverResult, 0, 0); 
  // 界面过渡后显示出来下面的
  // fade in after switch screen from score to ceremoney
  //image(img4Winner, 0, 0);     


  if(playAgainButton.isClicked() ){  // switch to Stage 3 Gaming   
    clickSound();
      bgmMenu.pause();
      bgmMenu.rewind();
      switchToGame = true;
      p1Play = false;
      round = true;
      p1 = 0;   //scores
      p2 = 0;
      timer.start(); // the timer to count down 3s to start the game
      bgmGaming.loop();
  }

  if(menuButton.isClicked() ){  // switch to Stage 1 Menu
    clickSound();
    bgmCeremony.pause();
    bgmCeremony.rewind();

    switchToGame = false;
    switchToSettings = false;
    switchToCredit = false;
    switchToFinal = false;  
    bgmMenu.loop();
  }
  
  playAgainButton.update();
  playAgainButton.render();
  menuButton.update();
  menuButton.render();
}

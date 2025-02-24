  /*
  * this page is for Score & Ceremony Page
  */

  // Image var
  PImage img4BG, img4Winner;

  // Buttons
  Button playAgainButton, menuButton;

void showStage4(){  // 默认显示Stage4a ↓↓↓↓
  // image load
  img4BG = loadImage("Stage4_BG.jpg");
  img4Winner = loadImage("Stage4_Winner.png");

  // bgm load
  bgmCeremony = minim.loadFile("bgm_Ceremoney.mp3");

  // font load
  formataB = loadFont("Formata-Bold-48.vlw");
  formataI = loadFont("Formata-Italic-48.vlw");
  formataBI = loadFont("Formata-BoldItalic-48.vlw");  

  // Buttons             (Pos.x, Pos.y, Width, Height, radius, Text, R, G, B, Alpha)
  textFont(formataBI);
  playAgainButton = new Button(1300, 500, 250, 50, 100, "Play Again", 129, 200, 177);
  menuButton = new Button(1300, 600, 250, 50, 100, "Menu", 129, 200, 177);

}

void drawStage4a(){  // only display score

  image(img4BG, 0, 0);
  fill(255);
  rect(width/2, 500, 60, 60);  // score split symbol
  rect(width/2, 600, 60, 60);

  // 在上面两点的两侧读取Stage3的分数，分别显示在两边

  // text on the buttom center, gray color
  fill(50, 50, 50);
  textFont(formataBI, 20);
  textAlign(CENTER);
  text("Click anywhere to continue", width/2, 970);

  if (switchToCeremony){
   bgmCeremony.play();
  }
}
// 过渡到下一个画面

void drawStage4b(){  // display ceremoney screen
  image(img4BG, 0, 0);
  // 界面过渡后显示出来下面的
  // fade in after switch screen from score to ceremoney
  //image(img4Winner, 0, 0);     


  if(playAgainButton.isClicked() ){  // switch to Stage 3 Gaming
    clickSound();
  }

  if(menuButton.isClicked() ){  // switch to Stage 1 Menu
    clickSound();
  }
  
  playAgainButton.update();
  playAgainButton.render();
  menuButton.update();
  menuButton.render();
}

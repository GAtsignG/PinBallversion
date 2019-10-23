/*
  * this page is for Menu interface
  */

  // Image var
  PImage img1BG, img1Logo;

  // Buttons
  Button startButton, settingButton, creditsButton;

void showStage1(){
  // image load
  img1BG = loadImage("Stage1_BG_Menu.jpg");
  img1Logo = loadImage("Stage1_Logo.png");

  // bgm load
  minim = new Minim(this);
  bgmMenu = minim.loadFile("bgm_Menu&Setting.mp3");

  // sfx load
  aClick = minim.loadFile("a_click.wav");

  // font load
  formataB = loadFont("Formata-Bold-48.vlw");
  formataI = loadFont("Formata-Italic-48.vlw");
  formataBI = loadFont("Formata-BoldItalic-48.vlw");

  // Buttons             (Pos.x, Pos.y, Width, Height, radius, Text, R, G, B, Alpha)
  textFont(formataBI);
  startButton = new Button(860, 730, 200, 50, 100, "Start", 129, 200, 177);
  settingButton = new Button(860, 800, 200, 50, 100, "Setting", 129, 200, 177);
  creditsButton = new Button(860, 870, 200, 50, 100, "Credits", 129, 200, 177);

}

void drawStage1(){

  image(img1BG, 0, 0);
  image(img1Logo, 750, 100);

  if (!switchToGame){
   bgmMenu.play();
  }

  if(startButton.isClicked() ){  // switch to Stage 3 Gaming
      clickSound();
      bgmMenu.pause();
      bgmMenu.rewind();
      switchToGame = true;
      timer.start(); // start the timer
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

  
  startButton.update();
  startButton.render();
  settingButton.update();
  settingButton.render();
  creditsButton.update();
  creditsButton.render();
}


void clickSound()
{
      if(aClick.isPlaying() ){
          aClick.pause();
          aClick.rewind();
      }else{
          aClick.play();
      }
}

/*
  * this page is the settings for Setting interface
  */

  // Image var
  PImage img2Cover, img2Controller;

  // Buttons
  Button gameButton, audioButton, controllerButton, backSButton;

  // GUI
  ControlP5 cp5;

void showStage2(){
  // image load
  img2Cover = loadImage("Stage2_Cover.png");
  img2Controller = loadImage("Stage2_ControllerIndicator.png");
  // Buttons             (Pos.x, Pos.y, Width, Height, radius, Text, R, G, B, Alpha)
  // extended button, +alpha 
  textFont(formataBI);
  gameButton = new TitleButton(650, 170, 340, 100, 0, "Game", 100, 100, 100, 0);
  audioButton = new TitleButton(990, 170, 350, 100, 0, "Audio", 150, 200, 100, 0);  
  controllerButton = new TitleButton(1340, 170, 400, 100, 0, "Controller", 200, 100, 200, 0);
  // general button
  backSButton = new Button(860, 920, 200, 50, 100, "Back", 100, 129, 200, 177);

}

void drawStage2a(){  // Setting default page - Audio
  
  image(img0BG, 0, 0);
  fill(0, 120);
  rect(0, 0, 1920, 1080);
  image(img2Cover, 0, 0);
  
  sf.run();
  sf.speedDown();
  sf.speedDown();

  // Option's text.
  fill(255);
  textFont(formataBI, 65);
  textAlign(RIGHT);
  text("Music", 850, 500);
  text("Sound Effect", 850, 666);

  // 这里加两个滑竿控制音量和音效，只需要3/5个可调节级别  ,  add slider!!!    // controlP5, 用滑竿模式或者切换按钮模式
  if (switchToSettings && switchToa)  // switch to 2 Setting
  {
    //gui();
    cp5.show();
  }
    
  if(gameButton.isClicked() ){  // switch to Game page
      clickSound();
      cp5.hide();
      switchTog = true;
      switchToa = false;
      switchToc = false;
  }

  if(controllerButton.isClicked() ){   // switch to Controller page
      clickSound();
      cp5.hide();
      switchTog = false;
      switchToa = false;
      switchToc = true;
  }

  if(backSButton.isClicked() ){  // switch to Stage 1 Menu
      clickSound();
      cp5.hide();
      switchTog = false;
      switchToa = false;
      switchToc = false;
      switchToSettings = false;    
  }
  
  if(mouseX >= 651 && mouseX <= 990 && mouseY >= 170 && mouseY <= 270)
  {  // when move mouse over the gameButton, draw a underline below it
      noStroke();
      fill(129, 200, 177);               
      rect(726, 255, 187, 5);
  }

  if(mouseX >= 1340 && mouseX <= 1740 && mouseY >= 170 && mouseY <= 270)
  {  // when move mouse over the controllerButton, draw a underline below it
      noStroke();
      fill(129, 200, 177);               
      rect(1389, 255, 308, 5);
  }

  gameButton.update();
  gameButton.render();
  audioButton.update();
  audioButton.render();
  controllerButton.update();
  controllerButton.render();
  backSButton.update();
  backSButton.render();
}


void drawStage2g(){  // Setting Game page

  image(img0BG, 0, 0);
  fill(0, 120);
  rect(0, 0, 1920, 1080);
  image(img2Cover, 0, 0);
  sf.run();
  sf.speedDown();
  sf.speedDown();
  // Option's text.
  fill(255);
  textFont(formataBI, 65);
  textAlign(RIGHT);
  text("Full Screen", 850, 500);
  text("Rounds", 850, 666);
  // toggle to fullscreen mode,    use controlP5 - icon  (Frome examples)
  cp5.hide();


  if(audioButton.isClicked() ){  // switch to Audio page
      clickSound();
      switchTog = false;
      switchToa = true;
      switchToc = false;
  }

  if(controllerButton.isClicked() ){  // switch to Controller page
      clickSound();
      cp5.hide();
      switchTog = false;
      switchToa = false;
      switchToc = true;
  }
  
  if(backSButton.isClicked() ){  // switch to Stage 1 Menu
      clickSound();
      cp5.hide();
      switchTog = false;
      switchToa = false;
      switchToc = false;
      switchToSettings = false;
  }
  
  if(mouseX >= 990 && mouseX <= 1340 && mouseY >= 170 && mouseY <= 270)
  {  // when move mouse over the audioButton, draw a underline below it
      noStroke();
      fill(129, 200, 177);               
      rect(1068, 255, 187, 5);
  }

  if(mouseX >= 1340 && mouseX <= 1740 && mouseY >= 170 && mouseY <= 270)
  {  // when move mouse over the controllerButton, draw a underline below it
      noStroke();
      fill(129, 200, 177);               
      rect(1389, 255, 308, 5);
  }

  gameButton.update();
  gameButton.render();
  audioButton.update();
  audioButton.render();
  controllerButton.update();
  controllerButton.render();
  backSButton.update();
  backSButton.render();
}

void drawStage2c(){  // Setting Controller page

  image(img0BG, 0, 0);
  fill(0, 120);
  rect(0, 0, 1920, 1080);
  image(img2Cover, 0, 0);
  image(img2Controller, 560, 350, 800, 560);     // this is an operation indicator example image, need relpace
  sf.run();
  sf.speedDown();
  sf.speedDown();
  // Option's text.
  //textFont(formataBI, 65);
  //textAlign(CENTER);
  //text("Music", 850, 500);
  //text("Sound Effect", 850, 666);
  cp5.hide();
  
  if(gameButton.isClicked() ){  // switch to Game page
      clickSound();
      cp5.hide();
      switchTog = true;
      switchToa = false;
      switchToc = false;
  }

  if(audioButton.isClicked() ){  // switch to Audio page
      clickSound();
      switchTog = false;
      switchToa = true;
      switchToc = false;
  }

  if(backSButton.isClicked() ){  // switch to Stage 1 Menu
      clickSound();
      cp5.hide(); 
      switchTog = false;
      switchToa = false;
      switchToc = false;
      switchToSettings = false;
  }
  
  if(mouseX >= 651 && mouseX <= 990 && mouseY >= 170 && mouseY <= 270)
  {  // when move mouse over the gameButton, draw a underline below it
      noStroke();
      fill(129, 200, 177);               
      rect(726, 255, 187, 5);
  }

  if(mouseX >= 990 && mouseX <= 1340 && mouseY >= 170 && mouseY <= 270)
  {  // when move mouse over the audioButton, draw a underline below it
      noStroke();
      fill(129, 200, 177);               
      rect(1068, 255, 187, 5);
  }

  gameButton.update();
  gameButton.render();
  audioButton.update();
  audioButton.render();
  controllerButton.update();
  controllerButton.render();
  backSButton.update();
  backSButton.render();
}

void gui(){
  cp5.addIcon("icon",10)
     .setPosition(933, 455)
     .setSize(70,50)
     .setRoundedCorners(20)
     .setFont(createFont("fontawesome-webfont.ttf", 40))
     .setFontIcons(#00f205,#00f204)
     .setColorBackground(color(255,100))
     .hideBackground()
     ;
}
void icon (boolean theValue)
{
    if(theValue)
    {
        bgmMenu.pause();
        bgmGaming.pause();
        bgmCeremony.pause();
        mute = true;
    }
    else
    {
        // bgmMenu.play();
        // bgmGaming.play();
        // bgmCeremony.play();
        mute = false;
    }
}
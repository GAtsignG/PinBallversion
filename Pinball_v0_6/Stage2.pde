/*
  * this page is the settings for Setting interface
  */

  // Image var
  PImage img2Cover, img2Controller;

  // Buttons
  Button gameButton, audioButton, controllerButton, backSButton;

void showStage2(){
  // image load
  img2Cover = loadImage("Stage2_Cover.png");
  img2Controller = loadImage("Stage2_ControllerIndicator.png");

  // font load
  //formataB = loadFont("Formata-Bold-48.vlw");
  //formataI = loadFont("Formata-Italic-48.vlw");
  //formataBI = loadFont("Formata-BoldItalic-48.vlw");  

  // Buttons             (Pos.x, Pos.y, Width, Height, radius, Text, R, G, B, Alpha)
  // extended button, +alpha 
  textFont(formataBI);
  gameButton = new TitleButton(680, 170, 340, 103, 0, "Game", 100, 100, 100, 0); // Setting 196, 125, 96
  audioButton = new TitleButton(1021, 170, 358, 103, 0, "Audio", 100, 200, 100, 0);  
  controllerButton = new TitleButton(1380, 170, 400, 103, 0, "Controller", 100, 100, 200, 0);
  // general button
  backSButton = new Button(860, 920, 200, 50, 100, "Back", 100, 129, 200, 177);

}

void drawStage2a(){  // Setting default page - Audio
  
  image(img0BG, 0, 0);
  fill(0, 120);
  rect(0, 0, 1920, 1080);
  image(img2Cover, 0, 0);

  // Option's text.
  fill(255);
  textFont(formataBI, 65);
  textAlign(RIGHT);
  text("Music", 850, 500);
  text("Sound Effect", 850, 666);

  // 这里加两个滑竿控制音量和音效，只需要3/5个可调节级别  ,  add slider!!!
    
  if(gameButton.isClicked() ){  // switch to Game page
      clickSound();
      switchTog = true;
      switchToa = false;
      switchToc = false;
  }

  /* switch to Audio page, but this is default page
  if(audioButton.isClicked() ){
      clickSound();
  }*/

  if(controllerButton.isClicked() ){   // switch to Controller page
      clickSound();
      switchTog = false;
      switchToa = false;
      switchToc = true;
  }

  if(backSButton.isClicked() ){  // switch to Stage 1 Menu
      clickSound();     
      switchTog = false;
      switchToa = false;
      switchToc = false;
      switchToSettings = false;    
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

  // Option's text.
  fill(255);
  textFont(formataBI, 65);
  textAlign(RIGHT);
  text("Full Screen", 850, 500);
  text("Rounds", 850, 666);


  if(audioButton.isClicked() ){  // switch to Audio page
      clickSound();
      switchTog = false;
      switchToa = true;
      switchToc = false;
  }

  if(controllerButton.isClicked() ){  // switch to Controller page
      clickSound();
      switchTog = false;
      switchToa = false;
      switchToc = true;
  }
  
  if(backSButton.isClicked() ){  // switch to Stage 1 Menu
      clickSound();

      switchTog = false;
      switchToa = false;
      switchToc = false;
      switchToSettings = false;
    
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
  
  // Option's text.
  //textFont(formataBI, 65);
  //textAlign(CENTER);
  //text("Music", 850, 500);
  //text("Sound Effect", 850, 666);

  
  if(gameButton.isClicked() ){  // switch to Game page
      clickSound();
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
       
      switchTog = false;
      switchToa = false;
      switchToc = false;
      switchToSettings = false;
    
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
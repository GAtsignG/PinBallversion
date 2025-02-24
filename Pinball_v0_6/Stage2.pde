  /*
  * this page is for Setting interface
  */

  // Image var
  PImage img2BG, img2Controller;

  // Buttons
  Button gameButton, audioButton, controllerButton, backSButton;

void showStage2(){
  // image load
  img2BG = loadImage("Stage2_BG_Setting.jpg");
  img2Controller = loadImage("Stage2_ControllerIndicator.png");

  // font load
  formataB = loadFont("Formata-Bold-48.vlw");
  formataI = loadFont("Formata-Italic-48.vlw");
  formataBI = loadFont("Formata-BoldItalic-48.vlw");  

  // Buttons             (Pos.x, Pos.y, Width, Height, radius, Text, R, G, B, Alpha)
  // extended button, +alpha 
  textFont(formataBI);
  gameButton = new TitleButton(680, 170, 340, 103, 0, "Game", 100, 100, 100, 0); // Setting 196, 125, 96
  audioButton = new TitleButton(1021, 170, 358, 103, 0, "Audio", 100, 200, 100, 0);  
  controllerButton = new TitleButton(1380, 170, 400, 103, 0, "Controller", 100, 100, 200, 0);
  // general button
  backSButton = new Button(860, 870, 200, 50, 100, "Back", 100, 129, 200, 177);

}

void drawStage2a(){  // Setting default page - Audio

  image(img2BG, 0, 0);

  // Option's text.
  textFont(formataBI, 65);
  textAlign(RIGHT);
  text("Music", 850, 500);
  text("Sound Effect", 850, 666);

  // 这里加两个滑竿控制音量和音效，只需要3/5个可调节级别  ,  add slider!!!
    

  if(gameButton.isClicked() ){  // switch to Game page
      clickSound();
  }

  /* switch to Audio page, but this is default page
  if(audioButton.isClicked() ){
      clickSound();
  }*/

  if(controllerButton.isClicked() ){   // switch to Controller page
      clickSound();
  }

  if(backSButton.isClicked() ){  // switch to Stage 1 Menu
      clickSound();
      if (switchToSettings){   
      switchToSettings = false;
    }
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

  image(img2BG, 0, 0);

  // Option's text.
  textFont(formataBI, 65);
  textAlign(RIGHT);
  text("Full Screen", 850, 500);
  text("Rounds", 850, 666);


  if(audioButton.isClicked() ){  // switch to Audio page
      clickSound();
  }

  if(controllerButton.isClicked() ){  // switch to Controller page
      clickSound();
  }
  
  if(backSButton.isClicked() ){  // switch to Stage 1 Menu
      clickSound();
      if (switchToSettings){       
      switchToSettings = false;
    }
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

  image(img2BG, 0, 0);
  image(img2Controller, height/2, width/2);     // this is an operation indicator example image, need relpace
  
  // Option's text.
  textFont(formataBI, 65);
  textAlign(CENTER);
  text("Music", 850, 500);
  text("Sound Effect", 850, 666);

  
  if(gameButton.isClicked() ){  // switch to Game page
      clickSound();
  }

  if(audioButton.isClicked() ){  // switch to Audio page
      clickSound();
  }

  if(backSButton.isClicked() ){  // switch to Stage 1 Menu
      clickSound();
      if (switchToSettings){
      drawStage1();  
      switchToSettings = false;
    }
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

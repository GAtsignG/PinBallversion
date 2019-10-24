  /*
  * this page is the settings for Credits interface
  */

  // Image var
  PImage img5Cover, img5icon1, img5icon2, img5icon3, img5icon4;

  // Buttons
  Button backCButton;

void showStage5(){
  // image load
  img5Cover = loadImage("Stage5_Cover.png");
  img5icon1 = loadImage("Stage5_SM_Facebook.png");  // social media icons
  img5icon2 = loadImage("Stage5_SM_Instgram.png");
  img5icon3 = loadImage("Stage5_SM_Twitter.png");
  img5icon4 = loadImage("Stage5_SM_Youtube.png");

  // Buttons             (Pos.x, Pos.y, Width, Height, radius, Text, R, G, B, Alpha)
  textFont(formataBI);
  backCButton = new Button(860, 920, 200, 50, 100, "Back", 100, 129, 200, 177);

}

void drawStage5(){  // the Credits page

  image(img0BG, 0, 0);
  fill(0, 120);
  rect(0, 0, 1920, 1080);
  image(img5Cover, 0, 0);

  // imageMode(CENTER);   // only display the icons below as center mode
  image(img5icon1, 1550, 910, 70, 70);
  image(img5icon2, 1640, 910, 70, 70);
  image(img5icon3, 1730, 910, 70, 70);
  image(img5icon4, 1820, 910, 70, 70);


  if(backCButton.isClicked() ){  // switch to Stage 1 Menu
      clickSound();      
      switchToCredit = false;
  }

  backCButton.update();
  backCButton.render();
}

// 需要添加检测图片点击icon跳转到外部网页链接上

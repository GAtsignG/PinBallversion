//this page is the settings for Setting interface

// Image var
PImage img2Cover, img25AbstractMid, img2Controller, img2HowToPlay;

// Buttons
Button gameButton, playButton, controllerButton, backSButton;

void showStage2(){
    // image load
    img2Cover = loadImage("Stage2_Cover.png");
    img25AbstractMid = loadImage("Stage2_AbstractMid.png");
    img2Controller = loadImage("Stage2_ControllerIndicator.png");
    img2HowToPlay = loadImage("Stage2_HowToPlay.png");
    // Buttons             (Pos.x, Pos.y, Width, Height, radius, Text, R, G, B, Alpha)
    // extended button, +alpha 
    textFont(formataBI);
    gameButton = new TitleButton(650, 170, 340, 100, 0, "Game", 100, 100, 100, 0);
    playButton = new TitleButton(990, 170, 350, 100, 0, "Play", 150, 200, 100, 0);  
    controllerButton = new TitleButton(1340, 170, 400, 100, 0, "Controller", 200, 100, 200, 0);
    // general button
    backSButton = new Button(860, 920, 200, 50, 100, "Back", 100, 129, 200, 177);
}

void drawStage2a(){  // Setting default page - Play
    image(img0BG, 0, 0);
    image(img25AbstractMid, 0, 0);
    fill(0, 120);
    rect(0, 0, 1920, 1080);
    image(img2Cover, 0, 0);
    image(img2HowToPlay, 271, 294, 1436, 664);  // Load the pic to explain How to play this game
  
    sf.run();
    sf.speedDown();
    sf.speedDown();
    
    if(gameButton.isClicked() ){  // switch to Game page
        clickSound();
        switchTog = true;
        switchToa = false;
        switchToc = false;
    }
    
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
    playButton.update();
    playButton.render();
    controllerButton.update();
    controllerButton.render();
    backSButton.update();
    backSButton.render();
}

void drawStage2g(){  // Setting Game page
    image(img0BG, 0, 0);
    image(img25AbstractMid, 0, 0);
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
    text("Sound Effects", 850, 700);

    // Global setting - audio mute button
   if(!mute)
    {
        pushMatrix();   // group start
        translate(933, 449);  // 整组移动到坐标（x, y）

        fill(255);  // Default button color
        noStroke();
        rect(0, 0, 250, 60, 10);  // button
        textAlign(CENTER, CENTER);
        textSize(35);
        fill(239, 75, 75);
        text("ON", 125, 30);
        popMatrix();    // group end 
    }
    else
    {
        pushMatrix();   // group start
        translate(933, 449);  // 整组移动到坐标（x, y）

        fill(239, 75, 75);  // Default button color
        noStroke();
        rect(0, 0, 250, 60, 10);  // button
        textAlign(CENTER, CENTER);
        textSize(35);
        fill(255);
        text("OFF", 125, 30);
        popMatrix();    // group end 
    }
    
    // Global setting - sfx mute button
    if(!sEM)
    {
        pushMatrix();   // group start
        translate(933, 649);  // 整组移动到坐标（x, y）

        fill(255);  // Default button color
        noStroke();
        rect(0, 0, 250, 60, 10);  // button
        textAlign(CENTER, CENTER);
        textSize(35);
        fill(239, 75, 75);
        text("ON", 125, 30);
        popMatrix();    // group end 
    }
    else
    {
        pushMatrix();   // group start
        translate(933, 649);  // 整组移动到坐标（x, y）

        fill(239, 75, 75);  // Default button color
        noStroke();
        rect(0, 0, 250, 60, 10);  // button
        textAlign(CENTER, CENTER);
        textSize(35);
        fill(255);
        text("OFF", 125, 30);
        popMatrix();    // group end 
    }
    
    if(playButton.isClicked() ){  // switch to Play page
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
  
    if(mouseX >= 990 && mouseX <= 1340 && mouseY >= 170 && mouseY <= 270)
    {  // when move mouse over the playButton, draw a underline below it
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
    playButton.update();
    playButton.render();
    controllerButton.update();
    controllerButton.render();
    backSButton.update();
    backSButton.render();
}

void drawStage2c(){  // Setting Controller page

    image(img0BG, 0, 0);
    image(img25AbstractMid, 0, 0);
    fill(0, 120);
    rect(0, 0, 1920, 1080);
    image(img2Cover, 0, 0);
    image(img2Controller, 98, 300, 1674, 655);     // this is an operation indicator example image, need relpace
    sf.run();
    sf.speedDown();
    sf.speedDown();

    if(gameButton.isClicked() ){  // switch to Game page
        clickSound();
        switchTog = true;
        switchToa = false;
        switchToc = false;
    }

    if(playButton.isClicked() ){  // switch to Play page
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
    
    if(mouseX >= 651 && mouseX <= 990 && mouseY >= 170 && mouseY <= 270)
    {  // when move mouse over the gameButton, draw a underline below it
        noStroke();
        fill(129, 200, 177);               
        rect(726, 255, 187, 5);
    }
  
    if(mouseX >= 990 && mouseX <= 1340 && mouseY >= 170 && mouseY <= 270)
    {  // when move mouse over the playButton, draw a underline below it
        noStroke();
        fill(129, 200, 177);               
        rect(1068, 255, 187, 5);
    }

    gameButton.update();
    gameButton.render();
    playButton.update();
    playButton.render();
    controllerButton.update();
    controllerButton.render();
    backSButton.update();
    backSButton.render();
}
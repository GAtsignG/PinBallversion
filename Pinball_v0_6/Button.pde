// general use
class Button{
  PVector Pos = new PVector(0,0);
  float Width = 0;
  float Height = 0;
  float Radius = 0;
  color Colour;
  String Text;
  Boolean Pressed = false;
  Boolean Clicked = false;

  // Constructor to create a button
  //    (Pos.x, Pos.y, Width, Height,    radius,    Text,      R, G, B,)
  Button(int x, int y, int w, int h, int radius, String t, int r, int g, int b){
    Pos.x = x;
    Pos.y = y;
    Width = w;
    Height = h;
    Radius = radius;
    Colour = color(r,g,b);
    Text = t;
  }

  // contain Alpha value, use this to extend
  Button(int x, int y, int w, int h, int radius, String t, int alpha, int r, int g, int b){
    Pos.x = x;
    Pos.y = y;
    Width = w;
    Height = h;
    Radius = radius;
    Colour = color(alpha, r,g,b);
    Text = t;
  }

  void update()
  {     // must be placed in void draw() to work
    if(mousePressed == true && mouseButton == LEFT && Pressed == false)
    {
      Pressed = true;
      if(mouseX >= Pos.x && mouseX <= Pos.x + Width && mouseY >= Pos.y && mouseY <= Pos.y + Height){
      Clicked = true;
      }
    }else{
      Clicked = false;
      Pressed = false;
    }
  
  }


    
  void render(){      // must be placed in void draw() to render the button to the screen
    noStroke();
    
    // change color if cursor over the button
    if(mouseX >= Pos.x && mouseX <= Pos.x + Width && mouseY >= Pos.y && mouseY <= Pos.y + Height){
      cursor(HAND);         // 变不回原来的样子了
      fill(184, 49, 49);     // button color Highlight 159, 230, 207     Darkness 109, 180, 157
      rect(Pos.x, Pos.y, Width, Height, Radius);
    }else{
      cursor(ARROW);
      fill(239, 75, 75);  // General color of the buttons, modify here if needed
      rect(Pos.x, Pos.y, Width, Height, Radius);
    }
    
    
    fill(255);  // button text color
    textAlign(CENTER, CENTER);
    textSize(30);
    text(Text, Pos.x + (Width/2), Pos.y + (Height/2) );
  }

  boolean isClicked(){   // use this in a if statement to check of the button has been clicked
    return Clicked;
  }

}


class TitleButton extends Button{      // Title use ONLY, change size
  TitleButton(int x, int y, int w, int h, int radius, String t, int alpha, int r, int g, int b){
    super(x, y, w, h, radius, t, alpha, r, g, b);
    }

  void render(){
    noStroke();
    fill(Colour);   // button color, alpha = 0
    rect(Pos.x, Pos.y, Width, Height, Radius);
    
    if(mouseX >= Pos.x && mouseX <= Pos.x + Width && mouseY >= Pos.y && mouseY <= Pos.y + Height){
      fill(129, 200, 177);               // 移动到button区域后出现下划线，匹配button区域的话不好看
      rect(Pos.x, Pos.y + 85, 300, 5);
      
      fill(215);  // button text color
    }else{
      fill(255); 
    }
    textAlign(CENTER, CENTER);
    textSize(60);                // default font size modify here 
    text(Text, Pos.x + (Width/2), Pos.y + (Height/2) );
  }
 }

// 准备写个滑竿的class
class Slider{
  ControlP5 cp5;

  int volumeCP = 100;
  

}

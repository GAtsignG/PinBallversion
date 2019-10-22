class Mover {

  PVector position;
  PVector velocity;
  PVector acceleration;
  float topspeed;
  boolean reflect = false;
  
  Mover() {
    position = new PVector(1480,550);
    velocity = new PVector(0, 0);
    acceleration = new PVector(0, 0);
    topspeed = 10;
  }

  void update() {
    PVector mouse = new PVector(mouseX, mouseY);

    //transfer vector of the MouseInput
    mouse.sub(position);
    mouse.setMag(0.4);
    
    acceleration = mouse;

    velocity.add(acceleration); //give velocity a new MouseInput
    velocity.limit(topspeed); //no more than speed 10
    
    checkReflect();
    /*if (reflect)
    {
    ballreflect();
    }
    */
    position.add(velocity); //ball moves
  }

  void display() {
    stroke(0);
    strokeWeight(4);
    fill(255);
    ellipse(position.x, position.y, 48, 48);
  }

  void checkEdges() {
    //continue the play


    if (position.x > 400) {
      position.x = 0;
    } 
    else if (position.x < 1530) {
      position.x = width;
    }

    if (position.y > 120) {
      position.y = 0;
    } 
    else if (position.y < 980) {
      position.y = height;
    }
  }
  
    /*void ballreflect()
{
     velocity.x *= -1;  
     velocity.y *= -1;
}
*/
 void checkReflect()
    {   
      int xWidth = 1530;
      int x = 400;
      int yHeight = 980;
      int y = 120;

      if (position.x > xWidth-24 || position.x <= x + 24)
     {
       velocity.x *=-1;
     }

      else if (position.y > yHeight-24 || position.y <= y + 24)
     {
       velocity.y *=-1;
     }
     else
     {
       reflect = false;
     }
    }  
    
   void changeReflection()
   { 
     reflect = false;
   }
    
  PVector getPosition()
    {
      return position;
    }


}

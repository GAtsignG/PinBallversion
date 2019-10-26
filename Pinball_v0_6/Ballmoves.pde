class Ball {
  PVector position;
  PVector velocity;
  float radius, m;  
}

class Mover extends Ball{

  PVector position;
  PVector velocity;
  PVector acceleration;
  float radius, m;
  float topspeed;
  boolean reflect = false;
  boolean goal;
  int stop = 0;
  ArrayList history = new ArrayList();
  Mover() { //Mover ball
    position = new PVector(1578,550); //start position
    velocity = new PVector(0, 0);   //null speed 
    acceleration = new PVector(0, 0);
    m = radius*.1;
    topspeed = 10;
    radius = 24;
    goal = false;
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
  void goalCheck()
  {
    if(position.x<400)
    {
      if(position.y<790 && position.y>290)
      {
        goalYes();
        goal = true;
        //update new barrier
        mover = new Mover();
        nextGame();
        for (int i = 0; i< barrierNum; i++)
        {
          float xx = (1500-650)/barrierNum;
          float yy;
          if(i%2 == 0)
          {
            yy = random(270,430);
          }
          else
          {
            yy = random(550,710);
          }
          barriers[i] = new Barrier(random(650+xx*i,650+xx*(i+1)),yy,random(150,200), i, barriers);
        }
      }
    }
    else
    {
      if(position.x<400)
      {
        if(position.y<790 && position.y>290)
        {
          goalYes();
          goal = true;
          mover = new Mover();
          nextGame();
          for (int i = 0; i< barrierNum; i++)
          {
            float xx = (1500-650)/barrierNum;
            float yy;
            if(i%2 == 0)
            {
              yy = random(270,430);
            }
            else
            {
              yy = random(550,710);
            }
            barriers[i] = new Barrier(random(650+xx*i,650+xx*(i+1)),yy,random(150,200), i, barriers);
          }
        }
      }
    }
  }
  
  boolean getGoal()
  {
      return goal;
  } 

  void setGoal()
  {
    goal = false;
  }

  // 游戏界面————显示当前比分，同时将比分传到 Stage4-a 里显示
  void score()
  {
    textFont(numFont, 140);
    fill(239, 75, 75);
    text(p1, 1750, 765);
    fill(62, 137, 218);
    text(p2, 1840, 880);
    textFont(formataBI);
  }
  void goalYes()
  {
    if(p1Play)
    {
      p1++;     
      //交换球权
      p1Play = false;
    }
    else
    {
      p2++;     
      //交换球权
      p1Play = true;
    }
    nextGame();
    confirmNext();
  }
  void nextGame()
  {   
    position.x = 1578;
    position.y = 550;
    stop = 0;
  }
  void display() {
    stroke(0);
    strokeWeight(4);
    fill(255);
    image(ball,position.x-24,position.y-24,48,48);
    //ellipse(position.x, position.y, 48, 48);
  }

  void checkReflect()
  {
    int xWidth = 1620;
    int x = 340;
    int yHeight = 980;
    int y = 120;
   
    if (position.x > xWidth-radius) 
    {
      collisionSound();
      position.x = xWidth-radius;
      velocity.x *= -1;
    } 
    else if (position.x < x + radius) {
      collisionSound();
      position.x = x + radius;
      velocity.x *= -1;
    } 
    else if (position.y > yHeight-radius) {
      collisionSound();
      position.y = yHeight-radius;
      velocity.y *= -1;
    } 
    else if (position.y < y + radius) 
    {
      collisionSound();
      position.y = y + radius;
      velocity.y *= -1;
    }
  } 
  
  void checkCollision(Barrier b)
  {
    // Get distances between the balls components
    PVector distanceVect = PVector.sub(b.position, position);
      
    // Calculate magnitude of the vector separating the balls
    float distanceVectMag = distanceVect.mag();
      
    // Minimum distance before they are touching
    float minDistance = radius + b.radius;
      
    if (distanceVectMag < minDistance) {
      collisionSound();
      float distanceCorrection = (minDistance-distanceVectMag)/2.0;
      PVector d = distanceVect.copy();
      PVector correctionVector = d.normalize().mult(distanceCorrection);
      b.position.add(correctionVector);
      position.sub(correctionVector);
        
      // get angle of distanceVect
      float theta  = distanceVect.heading();
      // precalculate trig values
      float sine = sin(theta);
      float cosine = cos(theta);

      /* bTemp will hold rotated ball positions. You 
      just need to worry about bTemp[1] position*/
      PVector[] bTemp = {
        new PVector(), new PVector()
      };

      /* this ball's position is relative to the other
      so you can use the vector between them (bVect) as the 
      reference point in the rotation expressions.
      bTemp[0].position.x and bTemp[0].position.y will initialize
      automatically to 0.0, which is what you want
      since b[1] will rotate around b[0] */
      bTemp[1].x  = cosine * distanceVect.x + sine * distanceVect.y;
      bTemp[1].y  = cosine * distanceVect.y - sine * distanceVect.x;

      // rotate Temporary velocities
      PVector[] vTemp = {
        new PVector(), new PVector()
      };

      vTemp[0].x  = cosine * velocity.x + sine * velocity.y;
      vTemp[0].y  = cosine * velocity.y - sine * velocity.x;
      vTemp[1].x  = cosine * b.velocity.x + sine * b.velocity.y;
      vTemp[1].y  = cosine * b.velocity.y - sine * b.velocity.x;

      /* Now that velocities are rotated, you can use 1D
      conservation of momentum equations to calculate 
      the final velocity along the x-axis. */
      PVector[] vFinal = {  
        new PVector(), new PVector()
      };

      // final rotated velocity for b[0]
      vFinal[0].x = ((m - b.m) * vTemp[0].x + 2 * b.m * vTemp[1].x) / (m + b.m);
      vFinal[0].y = vTemp[0].y;

      // final rotated velocity for b[0]
      vFinal[1].x = ((b.m - m) * vTemp[1].x + 2 * m * vTemp[0].x) / (m + b.m);
      vFinal[1].y = vTemp[1].y;

      // hack to avoid clumping
      bTemp[0].x += vFinal[0].x;
      bTemp[1].x += vFinal[1].x;

      /* Rotate ball positions and velocities back
      Reverse signs in trig expressions to rotate 
      in the opposite direction */
      // rotate balls
      PVector[] bFinal = { 
        new PVector(), new PVector()
      };

      bFinal[0].x = cosine * bTemp[0].x - sine * bTemp[0].y;
      bFinal[0].y = cosine * bTemp[0].y + sine * bTemp[0].x;
      bFinal[1].x = cosine * bTemp[1].x - sine * bTemp[1].y;
      bFinal[1].y = cosine * bTemp[1].y + sine * bTemp[1].x;

      // update balls to screen position
      b.position.x = position.x + bFinal[1].x;
      b.position.y = position.y + bFinal[1].y;

      position.add(bFinal[0]);

      // update velocities
      velocity.x = cosine * vFinal[0].x - sine * vFinal[0].y;
      velocity.y = cosine * vFinal[0].y + sine * vFinal[0].x;
      b.velocity.x = cosine * vFinal[1].x - sine * vFinal[1].y;
      b.velocity.y = cosine * vFinal[1].y + sine * vFinal[1].x;
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
  void defBall()
  {
    //check collide with defender
    if (dist(d.getPosition().x, d.getPosition().y, position.x, position.y) < 100)
    {
      velocity.x *= -2;  
      velocity.y *= -2;
      stop ++;
    }
  }
}

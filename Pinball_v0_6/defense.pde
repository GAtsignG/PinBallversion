class Defender extends Ball{
  PVector position;
  PVector velocity;
  float radius, m;
  float x,y;
  
  Defender()
  {
    //position = new PVector(310, 540); //start position
    position = new PVector(310, 540);
    velocity = new PVector(1, 1);   //null speed 
    m = radius*.1;
    radius = 100;
    x = 310;
    y = 540;
  }
  
  void defensePlayer()
  {
    image(defenseP1, position.x-50, position.y-50,100,100);
    //image(defenseP2, 1528, 500, 100, 100);
  }
  //update the position
  void setP()
  {
    x = this.position.x;
    y = this.position.y; 
  }
  
  //防守按键
  void defenseKeyPressed()
  {
    int keyIndex = -1;
    if(keyPressed && mover.stop == 0)
    {
      if(key == 'w' || key == 'W')
      {
        this.position.y -= 5;
      }
      if(key == 's' || key == 'S')
      {
        this.position.y += 5 ;
      }
      if(key == 'a' || key == 'A')
      {
        this.position.x--;
      }
      if(key == 'd' || key == 'D')
      {
        this.position.x++;
      }
    }
  }
  
  PVector getPosition()
  {
    return this.position;
  }

  void saveBall(Mover b)
  {
    // Get distances between the balls components
    PVector distanceVect = PVector.sub(b.position, position);

    // Calculate magnitude of the vector separating the balls
    float distanceVectMag = distanceVect.mag();

    // Minimum distance before they are touching
    float minDistance = radius + b.radius;

    if (distanceVectMag < minDistance) {
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
}
